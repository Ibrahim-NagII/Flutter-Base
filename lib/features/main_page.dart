import 'package:flutter/material.dart';
import 'package:flutter_base/features/intro/view/onboarding.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/widgets/nav_app.dart';

class MainPage extends StatefulWidget {
  final int index;

  const MainPage({super.key, this.index = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  int _index = 0;

  @override
  void initState() {
    _index = widget.index;
    super.initState();
  }

  Widget fregmant(int index) {
    switch (index) {
      case 0:
        return Container();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return const OnBoarding();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.WHITE_COLOR,
      body: fregmant(_index),
      bottomNavigationBar: NavApp(
        index: _index,
        onSelect: (p0) {
          _index = p0;
          setState(() {});
        },
      ),
    );
  }
}
