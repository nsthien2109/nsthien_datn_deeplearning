import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String title;
  Function onTap;
  double? width;
  double? height;
  double? radius;
  Button(
      {super.key,
      required this.title,
      required this.onTap,
      this.width,
      this.height,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 7)),
            fixedSize: Size(width ?? widthP(context), height ?? 55),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white),
        onPressed: () => onTap(),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ));
  }
}
