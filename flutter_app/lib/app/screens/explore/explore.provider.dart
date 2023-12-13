import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/services/bird_services.dart';

class ExploreProvider extends ChangeNotifier {
  BirdResponse? _data = BirdResponse();
  BirdResponse? get data => _data;
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  ExploreProvider() {
    getBird(1);
    _scrollController.addListener(() async {
      // Check if the user has reached the end of the list
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load more data when reaching the bottom
        await getBird(_data?.page != null ? (_data!.page! + 1) : 1);
      }
    });
    notifyListeners();
  }
  // get home data
  Future<void> getBird(page) async {
    try {
      var birdData = await getBirds(page ?? 1);
      _data = page == 1
          ? birdData
          : BirdResponse(
              page: birdData.page,
              pageSize: birdData.pageSize,
              total: birdData.total,
              totalPages: birdData.totalPages,
              results: [...?_data?.results, ...?birdData.results]);
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
