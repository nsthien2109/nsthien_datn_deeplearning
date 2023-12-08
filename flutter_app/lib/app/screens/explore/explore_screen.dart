import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/explore/explore.provider.dart';
import 'package:njha_bird_detect/app/screens/explore/widgets/bird_list.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          'Explore Birds',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey[100],
              height: 1.0,
            )),
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: AppColors.blackGrey),
              onPressed: () {}),
        ],
      ),
      body: Consumer<ExploreProvider>(builder: (context, exploreState, _) {
        // return BirdList(
        //   birds: exploreState.birds,
        //   refreshPage: exploreState.getBird(1),
        // );
        return Container();
      }),
    );
  }
}
