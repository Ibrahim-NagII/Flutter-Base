import 'package:flutter/material.dart';
import 'package:flutter_base/components/custom_images.dart';
import 'package:flutter_base/helpers/translation/all_translation.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return allTranslations.currentLanguage == "ar"
        ? customImageIconSVG(imageName: "right")
        : customImageIconSVG(imageName: "left");
  }
}

class ArrowBackIos extends StatelessWidget {
  final Color color;
  const ArrowBackIos({super.key, this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return allTranslations.currentLanguage != "ar"
        ? customImageIconSVG(imageName: "ios-right", color: color)
        : customImageIconSVG(imageName: "ios-left", color: color);
  }
}
