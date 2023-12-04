import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/screens/explore/explore_screen.dart';
import 'package:njha_bird_detect/app/screens/history/history_screen.dart';
import 'package:njha_bird_detect/app/screens/home/home.dart';
import 'package:njha_bird_detect/app/screens/layout.provider.dart';
import 'package:njha_bird_detect/app/screens/profile/profile_screen.dart';
import 'package:njha_bird_detect/app/shared/widgets/nav_bar.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(builder: (context, layoutState, _) {
      return Scaffold(
        body: PageView(
          controller: layoutState.pageController,
          onPageChanged: (value) => layoutState.onChangeTab(value),
          children: const [
            HomeScreen(),
            ExploreScreen(),
            HistoryScreen(),
            ProfileScreen()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Iconsax.scan),
        ),
        bottomNavigationBar: NavBar(
            currentTab: layoutState.currentTab,
            onChangeTab: (value) => layoutState.onChangeTab(value)),
      );
    });
  }
}
