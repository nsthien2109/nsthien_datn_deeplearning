import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavBar extends StatelessWidget {
  int currentTab;
  Function onChangeTab;
  NavBar({super.key, required this.currentTab, required this.onChangeTab});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: (index) => onChangeTab(index),
        selectedIndex: currentTab,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(
              icon: Icon(Iconsax.search_favorite), label: "Explore"),
          NavigationDestination(
              icon: Icon(Iconsax.back_square), label: "History"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Profile")
        ]);
  }
}
