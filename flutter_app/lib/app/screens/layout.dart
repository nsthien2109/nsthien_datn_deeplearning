import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/screens/auth/auth.provider.dart';
import 'package:njha_bird_detect/app/screens/explore/explore_screen.dart';
import 'package:njha_bird_detect/app/screens/history/history_screen.dart';
import 'package:njha_bird_detect/app/screens/home/home.dart';
import 'package:njha_bird_detect/app/screens/layout.provider.dart';
import 'package:njha_bird_detect/app/screens/profile/profile_screen.dart';
import 'package:njha_bird_detect/app/shared/widgets/choose_image_options.dart';
import 'package:njha_bird_detect/app/shared/widgets/login_required.dart';
import 'package:njha_bird_detect/app/shared/widgets/nav_bar.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LayoutProvider, AuthProvider>(
        builder: (context, layoutState, authState, _) {
      return Scaffold(
        body: PageView(
          controller: layoutState.pageController,
          onPageChanged: (value) => layoutState.onChangeTab(value),
          children: [
            const HomeScreen(),
            const ExploreScreen(),
            authState.auth?.accessToken != null
                ? const HistoryScreen()
                : const LoginRequiredPage(),
            authState.auth?.accessToken != null
                ? const ProfileScreen()
                : const LoginRequiredPage(),
          ],
        ),
        bottomNavigationBar: NavBar(
            currentTab: layoutState.currentTab,
            onChangeTab: (value) => layoutState.onChangeTab(value)),
      );
    });
  }
}
