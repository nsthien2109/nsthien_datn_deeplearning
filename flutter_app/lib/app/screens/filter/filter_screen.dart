import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/filter/filter.provider.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_type_grid.dart';
import 'package:provider/provider.dart';

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
                BirdTypeGrid(
                    gridTitle: "Bird Orders",
                    gridSize: 4,
                    listData: state.birdOrders),
                BirdTypeGrid(
                  gridTitle: "Bird Families",
                  gridSize: 4,
                  listData: state.birdFamilies,
                ),
                BirdTypeGrid(
                  gridTitle: "Bird Status",
                  gridSize: 4,
                  listData: state.birdStatus,
                )
              ],
            );
          }),
        ));
  }
}
