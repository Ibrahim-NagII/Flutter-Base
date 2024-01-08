import 'package:flutter/material.dart';
import 'package:flutter_base/components/animated_widget.dart';
import 'package:flutter_base/components/custom_btn.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';
import 'package:flutter_base/navigation/routes.dart';
import 'package:flutter_base/utility/extintions.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.WHITE_COLOR,
        title: const Text("الحساب"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListAnimator(
          verticalOffset: 50.0,
          horizontalOffset: 0.0,
          data: [
            SizedBox(height: 96.h),
            AnimatedWidgets(
              durationMilli: 2000.0,
              verticalOffset: 0.0,
              horizontalOffset: 0.0,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Styles.PRIMARY_COLOR.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      "LOGO",
                      style: TextStyle(
                        color: Styles.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            const Center(
              child: Text(
                "قم بتسجيل الدخول",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                "قم بتسجيل الدخول لكي تتمكن من \nالإستفادة من كامل المميزات",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Styles.PRIMARY_COLOR.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Hero(
              tag: "btn",
              child: CustomBtn(
                text: "تسجيل الدخول",
                onTap: () {
                  CustomNavigator.push(Routes.LOGIN);
                },
              ),
            ),
            SizedBox(height: 24.h),
            CustomBtn(
              text: "إنشاء حساب",
              onTap: () {},
              onlyBorder: true,
              txtColor: Styles.PRIMARY_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
