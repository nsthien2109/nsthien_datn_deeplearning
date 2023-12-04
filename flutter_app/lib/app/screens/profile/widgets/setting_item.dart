import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class SettingItem extends StatelessWidget {
  String title;
  Function onTap;
  SettingItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: .3, color: AppColors.blackGrey))),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), const Icon(Iconsax.arrow_right)],
        ),
      ),
    );
  }
}
