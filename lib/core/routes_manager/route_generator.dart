
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/routes.dart';

import '../../features/main_layout/main_layout.dart';
import '../../features/on_boarding/on_boarding.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
    case Routes.onBoardingRoute:
      return MaterialPageRoute(builder: (_) => const OnBoarding());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
