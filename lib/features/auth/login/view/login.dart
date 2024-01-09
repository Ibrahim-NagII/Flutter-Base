import 'package:flutter/material.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';
import 'package:flutter_base/navigation/routes.dart';
import 'package:flutter_base/utility/extintions.dart';
import 'package:flutter_base/components/animated_widget.dart';
import 'package:flutter_base/components/custom_btn.dart';
import 'package:flutter_base/components/custom_text_field.dart';
import 'package:flutter_base/helpers/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: ListAnimator(
                  verticalOffset: 50.0,
                  horizontalOffset: 0.0,
                  data: [
                    SizedBox(height: 24.h),
                    const Hero(
                      tag: "logo",
                      child: Material(
                        child: Center(
                          child: Text(
                            "LOGO",
                            style: TextStyle(
                              color: Styles.PRIMARY_COLOR,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 47.h),
                    const Text(
                      "أدخل رقم الهاتف لتسجيل الدخول",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "قم بالدخول عن طريق رقم الهاتف المربوط في حسابكم في أبشر ليتم إستكمال البيانات المطلوبة لإتمام العملية بنجاح",
                      style: TextStyle(
                        fontSize: 16,
                        color: Styles.PRIMARY_COLOR.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomTextField(
                      hint: "رقم الهاتف",
                      label: "رقم الهاتف",
                      keyboardType: TextInputType.phone,
                      onChanged: (v) {},
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
              Hero(
                tag: "btn",
                child: CustomBtn(
                  text: "تسجيل الحساب",
                  onPressed: () {
                    CustomNavigator.push(Routes.OTP);
                  },
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
