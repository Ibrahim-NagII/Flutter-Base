import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/components/animated_widget.dart';
import 'package:flutter_base/core/app_event.dart';
import 'package:flutter_base/features/splah/splash_bloc.dart';
import 'package:flutter_base/helpers/styles.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      SplashBloc.instance.add(Click());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedWidgets(
          durationMilli: 2000.0,
          verticalOffset: 0.0,
          horizontalOffset: 0.0,
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
    );
  }
}
