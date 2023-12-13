import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/auth/auth.provider.dart';
import 'package:njha_bird_detect/app/screens/profile/widgets/setting_item.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, authState, _) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 250,
              decoration: const BoxDecoration(color: AppColors.primaryColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/ava.png',
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authState.auth!.userData!.username!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.f3),
                      ),
                      Text(
                        authState.auth!.userData!.email!,
                        style: const TextStyle(
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
                  SettingItem(title: "Logout", onTap: () => authState.logout()),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
