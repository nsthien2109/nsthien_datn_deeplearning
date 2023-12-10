import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/services/bird_services.dart';

class HomeProvider extends ChangeNotifier {
  final _carouselController = CarouselController();
  CarouselController get carouselController => _carouselController;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  List<Bird?> _birds = [];
  List<Bird?> get birds => _birds;

  late Timer timer;

  HomeProvider() {
    getBirdHome();
  }

  // get home data
  Future<void> getBirdHome() async {
    try {
      final random = Random();
      var birdData = await getBirds(1 + random.nextInt(50));
      _birds = birdData;
      notifyListeners();
    } catch (e) {
      debugPrint('${e}');
      rethrow;
    }
  }

  // handles event change slider
  void onChangeSlider() {
    try {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        carouselController
            .nextPage(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.ease,
            )
            .catchError((e) => {});
      });
    } catch (e) {
      carouselController.stopAutoPlay();
      timer.cancel();
    }
  }

  // page index for dot indicator
  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
