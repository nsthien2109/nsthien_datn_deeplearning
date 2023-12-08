import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

import 'choose_image_action.dart';

class ChooseImageOptions extends StatelessWidget {
  const ChooseImageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizePersen(context, 5)),
      width: widthP(context),
      height: widthP(context) / 4,
      child: Row(
        children: [
          ChooseImageAction(
              title: "Camera",
              icon: Iconsax.camera,
              color: Colors.teal[200]!,
              onTap: () {}),
          SizedBox(width: sizePersen(context, 3)),
          ChooseImageAction(
              title: "Gallery",
              icon: Iconsax.folder,
              color: Colors.orange[200]!,
              onTap: () {}),
        ],
      ),
    );
  }
}
