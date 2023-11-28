import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/home/home.dart';

class AppRouter {
  static const String introRouter = '/intro';
  static const String mainRouter = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String favoriteRoute = '/favorite';
  static const String cartRouter = '/cart';
  static const String detailRouter = '/detail';
  static const String createStoreRouter = '/create-store';
  static const String editStoreRouter = '/edit-store';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case mainRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
    }
  }
}