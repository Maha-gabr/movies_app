import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
Widget tapWidget({required bool isSelected, required String genre}){
  return Container(
    padding: EdgeInsetsGeometry.all(8),
    decoration: BoxDecoration(
      color: isSelected? AppColor.primary : Colors.transparent,
      borderRadius: BorderRadiusGeometry.circular(16.r),
      border: Border.all(
        color: AppColor.primary
      )
    ),
    child: Text(genre, style:isSelected? AppTextStyle.boldBlack20.copyWith(fontSize: 18) : AppTextStyle.boldPrimary20.copyWith(fontSize: 18) ,),
  );
}