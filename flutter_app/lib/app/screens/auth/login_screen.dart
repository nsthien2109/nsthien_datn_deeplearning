import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:njha_bird_detect/app/shared/widgets/button.dart';
import 'package:njha_bird_detect/app/shared/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: AppColors.primaryColor),
        ),
        Positioned(
            top: 70,
            width: 250,
            child: Container(
              margin: const EdgeInsets.only(left: 26),
              child: const Text(
                "Hello again! Welcome Back",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
                width: widthP(context),
                height: heightP(context) - 200,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                    margin: const EdgeInsets.all(25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                              child: Column(
                            children: [
                              TextInput(
                                  hintText: "Email", iconSuffix: Iconsax.user),
                              const SizedBox(height: 25),
                              TextInput(
                                hintText: "Password",
                                iconSuffix: Iconsax.password_check,
                              ),
                              const SizedBox(height: 25),
                              const Button(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?"),
                                  TextButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, '/register'),
                                      child: const Text("Sign up"))
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    )))),
      ],
    ));
  }
}
