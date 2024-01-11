import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/filter/filter.provider.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_type_grid.dart';
import 'package:provider/provider.dart';

import '../../models/screen_type_arguments.dart';
import '../../shared/utils/theme.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bird Types"),
        ),
        body: SingleChildScrollView(
          child: Consumer<FilterProvider>(builder: (_, state, __) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Bird Orders",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, '/filter-type', arguments: ScreenTypeArguments("Bird Orders", state.birdOrders)),
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
                BirdTypeGrid(
                    gridSize: 4,
                    listData: state.birdOrders),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Bird Families",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, '/filter-type', arguments: ScreenTypeArguments("Bird Families", state.birdFamilies)),
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
                BirdTypeGrid(
                  gridSize: 4,
                  listData: state.birdFamilies,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Bird Status",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, '/filter-type', arguments: ScreenTypeArguments("Bird Status", state.birdStatus)),
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
                BirdTypeGrid(
                  gridSize: 4,
                  listData: state.birdStatus,
                )
              ],
            );
          }),
        ));
  }
}
