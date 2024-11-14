import 'package:blogify/extensions/context_extensions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({super.key, required this.onTabSelected});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final _icons = <IconData>[
    Icons.home_rounded,
    Icons.add_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _currentIndex,
      height: 70.0,
      backgroundColor: Colors.transparent,
      color: context.palette.greenPrimary,
      buttonBackgroundColor: context.palette.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      items: _icons
          .map((icon) => Icon(
                icon,
                size: 30,
                color: _currentIndex == _icons.indexOf(icon) ? context.palette.greenPrimary : context.palette.white,
              ))
          .toList(),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onTabSelected(index);
      },
    );
  }
}
