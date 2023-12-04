import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/profile/widgets/setting_item.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            height: 250,
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(width: 15),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nguyen Si Thien",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.f3),
                    ),
                    Text(
                      "nsthien@gmail.com",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.f6),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: widthP(context) - 70,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SettingItem(title: "Edit Profile", onTap: () {}),
                SettingItem(
                    title: "Logout",
                    onTap: () => Navigator.pushNamed(context, '/login'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
