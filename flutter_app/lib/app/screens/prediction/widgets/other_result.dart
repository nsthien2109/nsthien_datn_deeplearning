import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/screens/explore/widgets/bird_item.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class OtherResult extends StatelessWidget {
  List<Bird>? birds;
  OtherResult({super.key, required this.birds});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Other Result",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.f2)),
        ),
        CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => BirdItem(bird: birds![index]),
                    childCount: birds?.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.625,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
