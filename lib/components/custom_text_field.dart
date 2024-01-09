import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/utility/extintions.dart';
import 'package:flutter_base/utility/keybord_lisenter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.controller,
    this.isPassword,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintWidget,
    this.inputFormatters,
    this.prefixIcon,
    this.onTap,
    this.init,
    this.label,
  });
  final String? hint;
  final String? label;
  final String? init;
  final Widget? hintWidget;
  final TextEditingController? controller;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    keyboard.changeKeyBoardState(_focus.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.label}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12.h)
            ],
          ),
        TextFormField(
          focusNode: _focus,
          initialValue: widget.init,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.isPassword ?? false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          inputFormatters: <TextInputFormatter>[
            if (widget.keyboardType == TextInputType.number ||
                widget.keyboardType == TextInputType.phone) ...[
              FilteringTextInputFormatter.digitsOnly,
            ],
            if (widget.inputFormatters != null) ...widget.inputFormatters!
          ],
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.keyboardType == TextInputType.phone
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                      width: 50.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.flag),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 20,
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: context.theme.primaryColorLight,
                          )
                        ],
                      ),
                    ),
                  )
                : widget.prefixIcon,
          ),
        ),
      ],
    );
  }
}
