import 'package:flutter/cupertino.dart';

class LayoutProvider extends ChangeNotifier {
  int _currentTab = 0;
  int get currentTab => _currentTab;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void onChangeTab(int value) {
    _pageController.jumpToPage(value);
    _currentTab = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    notifyListeners();
    super.dispose();
  }
}
