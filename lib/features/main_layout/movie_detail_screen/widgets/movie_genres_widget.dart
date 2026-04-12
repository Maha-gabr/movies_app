import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_text_style.dart';
import '../../../../movie_detail_model/movie_detail_model_response.dart';
class MovieGenresWidget extends StatelessWidget {
  final int index;
  const MovieGenresWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: MovieDetailModelResponse
            .movieDetail[index]
            .genres
            .map(
              (genre) => Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.darkGrey,
            ),
            child: Text(
              genre,
              style: AppTextStyle.regWhit16,
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
