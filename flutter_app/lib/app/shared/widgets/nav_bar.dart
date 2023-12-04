import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
        itemCount: 5,
        tabBuilder: tabBuilder,
        activeIndex: activeIndex,
        onTap: onTap
    )
  }
}
