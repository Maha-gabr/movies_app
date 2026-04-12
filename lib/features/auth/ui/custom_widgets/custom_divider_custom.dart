import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_text_style.dart';

class CustomDividerCustom extends StatelessWidget {
  const CustomDividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 45.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.amber,
              thickness: 1.h,
              endIndent: 10.w,
            ),
          ),
          Text(
            "OR",
            style:AppTextStyle.regPrimary14,
          ),
          Expanded(
            child: Divider(
              color: Colors.amber,
              thickness: 1.h,
              indent: 10.w,
            ),
          ),
        ],
      ),
    );

  }
}
