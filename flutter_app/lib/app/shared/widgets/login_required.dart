import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:njha_bird_detect/app/shared/widgets/button.dart';

class LoginRequiredPage extends StatelessWidget {
  const LoginRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_rq.png', width: 200),
            const SizedBox(height: 40),
            const Text(
              textAlign: TextAlign.center,
              "Oh it seems you haven't logged in yet",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSize.f4,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              "You must log in to view this content",
              style: TextStyle(color: AppColors.blackGrey),
            ),
            const SizedBox(height: 40),
            Button(
              title: "Login",
              onTap: () => Navigator.pushNamed(context, '/login'),
              width: widthP(context) / 3,
              height: 50,
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
