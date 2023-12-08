import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/screens/explore/explore.provider.dart';
import 'package:njha_bird_detect/app/screens/explore/widgets/bird_item.dart';
import 'package:provider/provider.dart';

class BirdList extends StatelessWidget {
  List<Bird?> birds;
  Future refreshPage;
  BirdList({super.key, required this.birds, required this.refreshPage});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async => await refreshPage,
        child: CustomScrollView(
          controller: context.watch<ExploreProvider>().scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => BirdItem(bird: birds[index]!),
                    childCount: birds.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.625,
                ),
              ),
            )
          ],
        ));
  }
}
