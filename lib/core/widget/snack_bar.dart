import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar  {
  static void snackBar({required BuildContext context ,  String?text, Color? color}){
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(text??'Welcome back! 👋'),
        backgroundColor: color ?? Colors.green,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ) ,
    );
  }
}