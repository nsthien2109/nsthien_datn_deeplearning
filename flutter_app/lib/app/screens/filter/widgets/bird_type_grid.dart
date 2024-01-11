import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/screen_type_arguments.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_type_item.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdTypeGrid extends StatelessWidget {
  int gridSize;
  List<dynamic> listData;
  BirdTypeGrid(
      {super.key,
      required this.gridSize,
      required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            GridView.count(
              padding: const EdgeInsets.all(12),
              primary: false,
              childAspectRatio: 4 / 1.6,
              shrinkWrap: true,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              children: List.generate(gridSize, (index) {
                return BirdTypeItem(
                  data: listData.isNotEmpty ? listData[index] : null,
                );
              }),
            ),
          ],
        )
      ],
    );
  }
}
