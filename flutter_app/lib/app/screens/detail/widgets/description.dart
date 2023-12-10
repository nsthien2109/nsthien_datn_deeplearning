import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdDescription extends StatelessWidget {
  Bird bird;
  BirdDescription({super.key, required this.bird});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: TextStyle(fontSize: AppSize.f3, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 3),
          Text(bird.description ?? "Unknow"),
          const SizedBox(height: 10),
          const Text(
            "Distribution",
            style: TextStyle(fontSize: AppSize.f3, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 3),
          Text(bird.distribution ?? "Unknow"),
          const SizedBox(height: 10),
          const Text(
            "Diet",
            style: TextStyle(fontSize: AppSize.f3, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 3),
          Text(bird.diet ?? "Unknow"),
        ],
      ),
    );
  }
}
