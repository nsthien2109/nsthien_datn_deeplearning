import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:njha_bird_detect/app/screens/prediction/predict.provider.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:provider/provider.dart';

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
              onTap: () => Provider.of<PredictProvider>(context, listen: false)
                  .getImage(ImageSource.camera, context)),
          SizedBox(width: sizePersen(context, 3)),
          ChooseImageAction(
              title: "Gallery",
              icon: Iconsax.folder,
              color: Colors.orange[200]!,
              onTap: () => Provider.of<PredictProvider>(context, listen: false)
                  .getImage(ImageSource.gallery, context)),
        ],
      ),
    );
  }
}
