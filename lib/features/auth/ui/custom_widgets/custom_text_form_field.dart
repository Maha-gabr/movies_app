import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon ;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.suffixIcon,
    this.validator,  this.keyBoardType= TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyBoardType ,
      validator: validator,
      controller: controller,
      style: AppTextStyle.regWhite15,
      decoration: InputDecoration(
        errorStyle: AppTextStyle.regRed14,
        prefixIcon:prefixIcon ,
        suffixIcon:suffixIcon ,
        prefixIconColor: AppColor.white,
        suffixIconColor: AppColor.white,
        filled: true,
        fillColor: AppColor.darkGrey,
        hintText: hintText,

        hintStyle: AppTextStyle.regWhite15,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r)
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
        )
      ),
    );
  }
}
