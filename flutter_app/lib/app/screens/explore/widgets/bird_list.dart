import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/explore/widgets/bird_item.dart';

class BirdList extends StatelessWidget {
  const BirdList({super.key});

  @override
  Widget build(BuildContext context) {
    Future _refresh() async {
      print("ahjahaa");
    }

    return RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => const BirdItem(),
                    childCount: 5),
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
