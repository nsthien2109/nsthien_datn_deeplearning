import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/screens/auth/auth.provider.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:njha_bird_detect/app/shared/utils/validation.dart';
import 'package:njha_bird_detect/app/shared/widgets/button.dart';
import 'package:njha_bird_detect/app/shared/widgets/text_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                    "Hello! Sign up to get started",
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
                      child: Column(
                        children: [
                          Consumer<AuthProvider>(
                              builder: (context, authState, _) {
                            return Form(
                                key: authState.formKeySignUp,
                                child: Column(
                                  children: [
                                    TextInput(
                                        hintText: "Email",
                                        iconSuffix: Iconsax.user,
                                        controller: authState.emailController,
                                        validate: (value) =>
                                            emailValidate(value)),
                                    const SizedBox(height: 25),
                                    TextInput(
                                      hintText: "Username",
                                      iconSuffix: Iconsax.user_octagon4,
                                      controller: authState.usernameController,
                                      validate: (value) =>
                                          textBoxValidate(value),
                                    ),
                                    const SizedBox(height: 25),
                                    TextInput(
                                      hintText: "Password",
                                      iconSuffix: Iconsax.password_check,
                                      controller: authState.passwordController,
                                      validate: (value) =>
                                          passwordValidate(value),
                                    ),
                                    const SizedBox(height: 25),
                                    Button(
                                        title: "Sign Up",
                                        onTap: () =>
                                            authState.register(context)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Already have an account?"),
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("Sign in"))
                                      ],
                                    ),
                                  ],
                                ));
                          }),
                        ],
                      ),
                    ))),
          ],
        ));
  }
}
