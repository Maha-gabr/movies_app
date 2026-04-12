import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/firebase_utiles/firebase_options.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'features/auth/cubit/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
       BlocProvider(
         create: (cotext) => AuthCubit(),
         child: MaterialApp(
             debugShowCheckedModeBanner: false,
             home: child,
             onGenerateRoute: RouteGenerator.getRoute,
             // initialRoute: Routes.onBoardingRoute,
           initialRoute: Routes.SignUpRoute,
               ),
       ),
    );
  }
}
