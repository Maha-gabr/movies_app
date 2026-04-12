import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_color.dart';

Future<dynamic> buildBottomSheet(BuildContext cotext){
  List<String> avatars =[AppAssets.avatar1, AppAssets.avatar2, AppAssets.avatar3,AppAssets.avatar2, AppAssets.avatar3,AppAssets.avatar2, AppAssets.avatar3];
  return showModalBottomSheet(
    context: cotext,
    backgroundColor: AppColor.darkGrey,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        child: Wrap(
          crossAxisAlignment: .center,
          alignment: .spaceEvenly,
          spacing: 10.w,
          runSpacing: 10.h,
          children: avatars.map((e) {
            return Container(
              width: 120.w,
              height: 115.h,
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: AppColor.primary,
                ),
              ),
              child: Image.asset(e,width: 30.w,height: 30.h,),
            );
          }).toList(),
        ),
      );
    },
  );
}
