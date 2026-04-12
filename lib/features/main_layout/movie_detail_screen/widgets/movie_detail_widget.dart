import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_text_style.dart';
import '../../../../movie_detail_model/movie_detail_model_response.dart';
import '../../../auth/ui/custom_widgets/custom_elevated_button.dart';
import 'movie_info_Row.dart';
class MovieDetailWidget extends StatelessWidget {
  final int index;
  const MovieDetailWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(20.r),
          image: DecorationImage(image:
          NetworkImage(MovieDetailModelResponse.movieDetail[index].imagePath,),
              // AssetImage(MovieDetailModelResponse.movieDetail[index].imagePath,),
              fit: BoxFit.cover)
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w,vertical: 24.h),
        child: Column(
          children: [
            Row(children: [IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,))],),
            SizedBox(height: 200.h),
            SvgPicture.asset(AppAssets.playIcon),
            SizedBox(height: 150.h),
            Text((MovieDetailModelResponse.movieDetail[index].title),style: AppTextStyle.boldWhite24),
            SizedBox(height: 25.h,),
            Text(MovieDetailModelResponse.movieDetail[index].year.toString(),style: AppTextStyle.boldWhite20.copyWith(color: AppColor.grey),),
            SizedBox(height: 25.h,),
            CustomElevatedButton(text: 'Watch',color: AppColor.baseRed,textStyle: AppTextStyle.boldWhite20,),
            SizedBox(height: 20.h,),
            MovieInfoRow(index: index,),
          ],
        ),
      ),
    );
  }
}
