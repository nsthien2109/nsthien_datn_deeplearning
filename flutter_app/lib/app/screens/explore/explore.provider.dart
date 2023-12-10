import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/services/bird_services.dart';

class ExploreProvider extends ChangeNotifier {
  List<Bird?> _birds = [];
  List<Bird?> get birds => _birds;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final int _currentPage = 1;
  int get currentPage => _currentPage;

  ExploreProvider() {
    _scrollController.addListener(() async {
      // Check if the user has reached the end of the list
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load more data when reaching the bottom
        await getBird(_currentPage);
      }
    });
  }
  // get home data
  Future<void> getBird(int page) async {
    print(page);
    try {
      var birdData = await getBirds(page);
      _birds = page > 1 ? [...birds, ...birdData] : birdData;
      _currentPage + 1;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
