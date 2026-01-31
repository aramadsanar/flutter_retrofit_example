import 'package:flutter/material.dart';
import 'package:retrofit_dio_example/core/constants/app_constants.dart';
import 'package:retrofit_dio_example/ui/views/home_view.dart';

class Router {
  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute<Object>(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute<Object>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
