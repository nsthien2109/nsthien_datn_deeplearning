import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_type_item.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdTypeGrid extends StatelessWidget {
  String gridTitle;
  int gridSize;
  List<dynamic> listData;
  BirdTypeGrid(
      {super.key,
      required this.gridTitle,
      required this.gridSize,
      required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(gridTitle,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('view all',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greenLight),
                        textAlign: TextAlign.end),
                  )
                ],
              ),
            ),
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
                  data: listData.length > 0 ? listData[index] : null,
                );
              }),
            ),
          ],
        )
      ],
    );
  }
}
