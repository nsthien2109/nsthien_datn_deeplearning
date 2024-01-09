import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdOverView extends StatelessWidget {
  Bird bird;
  BirdOverView({super.key, required this.bird});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      child: Container(
          width: widthP(context),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("Overview",
                      style: TextStyle(
                          fontSize: AppSize.f4, fontWeight: FontWeight.w600)),
                  SizedBox(width: 15),
                  Icon(Iconsax.truck_fast)
                ],
              ),
              const SizedBox(height: 10),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Vietnamese : ",
                      style: TextStyle(color: AppColors.blackGrey)),
                  TextSpan(
                      text: bird.vietnameseName ?? "Unknow",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.f5,
                          color: AppColors.blackColor)),
                ]),
              ),
              const SizedBox(height: 5),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Scientific : ",
                      style: TextStyle(color: AppColors.blackGrey)),
                  TextSpan(
                      text: bird.scientificName ?? "Unknow",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.f5,
                          color: AppColors.blackColor)),
                ]),
              ),
              const SizedBox(height: 5),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Family : ",
                      style: TextStyle(color: AppColors.blackGrey)),
                  TextSpan(
                      text:
                          "${bird.family?.familyName ?? "Unknow"} - ${bird.family?.familyVietnameseName ?? ""}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.f5,
                          color: AppColors.blackColor)),
                ]),
              ),
              const SizedBox(height: 5),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Bird Order : ",
                      style: TextStyle(color: AppColors.blackGrey)),
                  TextSpan(
                      text:
                          "${bird.order?.orderName ?? "Unknow"} - ${bird.order?.orderVietnameseName ?? ""}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.f5,
                          color: AppColors.blackColor)),
                ]),
              ),
            ],
          )),
    );
  }
}
