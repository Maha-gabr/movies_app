
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/resources/app_color.dart';
class CustomElevatedButton extends StatelessWidget {
  final void Function()? onTap;
  final bool haveIcon ;
  final String  text;
  final String? iconImagePath;
  final Color color ;
  final TextStyle textStyle;
  const CustomElevatedButton({super.key,
    this.onTap, this.haveIcon= false,
    required this.text,  this.iconImagePath,
    this.color=AppColor.primary, required this.textStyle});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(

      style: ButtonStyle(
          backgroundColor:WidgetStateProperty.all(color),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 55.h))
      ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            haveIcon?
            SvgPicture.asset(
              iconImagePath!,
              width: 27.w,
              height: 27.h,
            )
                : SizedBox.shrink(),
            Text(text, style:textStyle,)
          ],

        ));
  }
}
