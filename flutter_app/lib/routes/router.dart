import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/auth/login_screen.dart';
import 'package:njha_bird_detect/app/screens/auth/register_screen.dart';
import 'package:njha_bird_detect/app/screens/detail/detail_screen.dart';
import 'package:njha_bird_detect/app/screens/home/home.dart';
import 'package:njha_bird_detect/app/screens/intro/intro_screen.dart';
import 'package:njha_bird_detect/app/screens/layout.dart';
import 'package:njha_bird_detect/app/screens/prediction/result_screen.dart';

class AppRouter {
  static const String introRoute = '/intro';
  static const String mainRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String favoriteRoute = '/favorite';
  static const String cartRouter = '/cart';
  static const String detailRouter = '/detail';
  static const String resultRouter = '/result';
  static const String createStoreRouter = '/create-store';
  static const String editStoreRouter = '/edit-store';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const IntroScreen(),
        );

      case loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );

      case registerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterScreen(),
        );

      case detailRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DetailScreen(),
        );

      case resultRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PredictResult(),
        );

      case mainRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Layout(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
