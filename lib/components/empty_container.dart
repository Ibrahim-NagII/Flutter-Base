import 'package:flutter/material.dart';
import 'package:flutter_base/helpers/media_query_helper.dart';
import 'package:flutter_base/helpers/styles.dart';
class EmptyContainer extends StatelessWidget {
  final String? img ;
  final String? txt ;
  final String? subText ;
  final double? remain ;
  final TextStyle? subStyle ;

  const EmptyContainer({Key? key, this.img, this.txt, this.remain = 0.0, this.subText, this.subStyle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height - remain!,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(img ?? 'assets/images/empty_image.png' , width: MediaQueryHelper.width*.8,),
              // customImageIconSVG(imageName: "empty-image"),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(txt ?? "No Data Yet !", textAlign: TextAlign.center , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 10,),
              Text(subText ?? "", textAlign: TextAlign.center , style: subStyle ?? Styles.SUB_HEADER_STYLE,)

            ],
          ),
        ),
      ),
    );
  }
}
