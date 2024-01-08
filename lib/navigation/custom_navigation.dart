import 'package:flutter/material.dart';
import 'package:flutter_base/features/intro/view/intro_view.dart';
import 'package:flutter_base/features/login/view/login.dart';
import 'package:flutter_base/features/splah/splash.dart';
import 'package:flutter_base/features/main_page.dart';
import '../features/intro/view/onboarding.dart';
import '../main.dart';
import 'routes.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.bounceInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.APP:
        return pageRouteBuilder(const MyApp());
      case Routes.SPLASH:
        return pageRouteBuilder(const Splash());
      case Routes.BOARDING:
        return pageRouteBuilder(const OnBoarding());
      case Routes.INTRO:
        return pageRouteBuilder(const IntroView());
      case Routes.LOGIN:
        return pageRouteBuilder(const Login());
      case Routes.MAIN_PAGE:
        return pageRouteBuilder(
          MainPage(
              index:
                  settings.arguments != null ? settings.arguments as int : 0),
        );

      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }

  static pageRouteBuilder(Widget child) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  static pop({dynamic result}) {
    if (navigatorState.currentState?.canPop() == true) {
      navigatorState.currentState?.pop(result);
    }
  }

  static push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    if (clean) {
      return navigatorState.currentState?.pushNamedAndRemoveUntil(
        routeName,
        (_) => false,
        arguments: arguments,
      );
    } else if (replace) {
      return navigatorState.currentState?.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    } else {
      return navigatorState.currentState?.pushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }
}
