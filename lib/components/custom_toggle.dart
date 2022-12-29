import 'package:flutter/cupertino.dart';
import 'package:flutter_base/helpers/styles.dart';
class CustomToggle extends StatefulWidget {
  final String? title;
  final Function? onTap;
  const CustomToggle({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool value = false ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          activeColor: Styles.PRIMARY_COLOR,
          onChanged: (v){
            setState(() => value = v);
            widget.onTap!(v);
          },
          value: value,
        ),
        const SizedBox(width: 10,),

        Expanded(child: Text(widget.title! , style: const TextStyle(fontWeight: FontWeight.w500 , fontSize: 13 , color: Styles.HEADER),)) ,

      ],
    );
  }
}
