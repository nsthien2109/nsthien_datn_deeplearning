import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            fixedSize: Size(widthP(context), 55),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white),
        onPressed: () {},
        child: const Text(
          "Sign In",
          style: TextStyle(fontWeight: FontWeight.w600),
        ));
  }
}
