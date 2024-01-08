import 'package:flutter/material.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/widgets/images.dart';

class NavApp extends StatefulWidget {
  const NavApp({
    super.key,
    required this.index,
    this.onSelect,
  });
  final int index;
  final Function(int)? onSelect;

  @override
  State<NavApp> createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {
  Color _selectedColor(int index) =>
      widget.index == index ? Styles.PRIMARY_COLOR : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 35,
      onTap: widget.onSelect,
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.index,
      backgroundColor: Styles.WHITE_COLOR,
      selectedLabelStyle: const TextStyle(
        color: Styles.PRIMARY_COLOR,
        fontSize: 11,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Styles.SUB_HEADER,
        fontSize: 11,
      ),
      selectedItemColor: Styles.PRIMARY_COLOR,
      items: [
        BottomNavigationBarItem(
          icon: Images(
            image: 'assets/svgs/cube.svg',
            color: _selectedColor(0),
          ),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: Images(
            image: 'assets/svgs/invoices.svg',
            color: _selectedColor(1),
          ),
          label: "المشاريع",
        ),
        BottomNavigationBarItem(
          icon: Images(
            image: 'assets/svgs/buildings.svg',
            color: _selectedColor(2),
          ),
          label: "المفضلة",
        ),
        BottomNavigationBarItem(
          icon: Images(
            image: 'assets/svgs/profile-circle.svg',
            color: _selectedColor(3),
          ),
          label: "الحساب",
        ),
      ],
    );
  }
}
