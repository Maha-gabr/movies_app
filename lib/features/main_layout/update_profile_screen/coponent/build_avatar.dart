import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/app_color.dart';
import 'build_bottom_sheet.dart';

GestureDetector buildAvatarGestureDetector(BuildContext context, String avatar) {
  return GestureDetector(
    onTap: (){
      buildBottomSheet(context);
    },
    child: Container(
      width: 118.w,
      height: 118.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.primary, width: 2.5),
      ),
      child: ClipOval(
          child: Image.asset(avatar,fit: BoxFit.cover,)
      ),
    ),
  );
}
