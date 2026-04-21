
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/app_assets.dart';
import '../../core/routes_manager/routes.dart';
import '../../cubits/user_cubit/auth_cubit.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final authCubit = context.read<AuthCubit>();
    await authCubit.restoreSession(); // fetch myUser from Firestore if logged in

    if (!mounted) return;

    if (authCubit.myUser != null) {
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            SvgPicture.asset(AppAssets.playIcon, fit: BoxFit.cover,)
          ],
        ),
      )
    );
  }
}