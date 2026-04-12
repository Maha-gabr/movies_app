
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/routes.dart';

import 'package:movies_app/features/main_layout/movie_detail_screen/movie_detail_screen.dart';

import '../../features/auth/ui/forget_pass/forget_pass_screen.dart';
import '../../features/auth/ui/login/login_screen.dart';
import '../../features/auth/ui/register/register_screen.dart';
import '../../features/main_layout/main_layout.dart';
import '../../features/main_layout/update_profile_screen/update_profile_screen.dart';
import '../../features/on_boarding/on_boarding.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
    case Routes.onBoardingRoute:
      return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.SignUpRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.forgetPassRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPassScreen());
      case Routes.detailScreenRoute:
        final index = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieDetailScreen(index: index,));
      case Routes.updateProfileRoute:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());


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
