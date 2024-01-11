import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_type_grid.dart';

import '../../models/screen_type_arguments.dart';

class FilterTypeScreen extends StatelessWidget {
  const FilterTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as ScreenTypeArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title ?? ""),
      ),
      body: BirdTypeGrid(gridSize: data?.data.length ?? 0, listData: [...data.data ?? []],
      ),
    );
  }
}
