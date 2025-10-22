import 'package:flutter/material.dart';
import 'package:optex_app/presentation/home/pages/home_screen.dart';
import 'package:optex_app/presentation/filter/pages/filter_screen.dart';
import 'package:optex_app/presentation/home/pages/main_screen.dart';


class Routes {
  static const splash = '/';
  static const main = '/main';
  static const home = '/home';
  static const filter = '/filter';
  static const categories = '/categories';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.filter:
        return MaterialPageRoute(builder: (_) => FilterScreen());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
