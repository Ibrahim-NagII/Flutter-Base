import 'package:flutter/material.dart';
import 'package:flutter_base/helpers/media_query_helper.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/helpers/translation/all_translation.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQueryHelper.topPadding,
          width: MediaQueryHelper.width,
          color: Styles.PRIMARY_COLOR,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQueryHelper.topPadding,
              width: MediaQueryHelper.width,
              color: Styles.PRIMARY_COLOR,
            ),
            Container(
              height: 187,
              width: MediaQueryHelper.width,
              color: Styles.PRIMARY_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allTranslations.text("welcome_login_title"),
                    style: const TextStyle(
                      color: Styles.WHITE_COLOR,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    allTranslations.text("welcome_login_subtitle"),
                    style: const TextStyle(
                      color: Styles.ACCENT_COLOR,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allTranslations.text("login"),
                    style: const TextStyle(
                      color: Styles.HEADER,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    allTranslations.text("login_helper_text"),
                    style: const TextStyle(
                      color: Styles.SUB_HEADER,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
