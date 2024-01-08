import 'package:flutter/material.dart';
import 'package:flutter_base/components/custom_arrow_back.dart';
import 'package:flutter_base/helpers/media_query_helper.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';

class NormalAppBar extends StatelessWidget {
  final String title;
  final Widget? action;
  const NormalAppBar({
    super.key,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryHelper.topPadding + 70,
      color: Styles.PRIMARY_COLOR,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryHelper.topPadding,
          right: 24,
          left: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => CustomNavigator.pop(),
              child: const ArrowBack(),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Styles.WHITE_COLOR,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            action ?? Container()
          ],
        ),
      ),
    );
  }
}
