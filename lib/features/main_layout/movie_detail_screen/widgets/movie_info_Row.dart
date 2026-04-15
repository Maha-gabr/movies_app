import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/models/movies/movie_detail_model.dart';

import '../../../../core/resources/app_color.dart';
class MovieInfoRow extends StatelessWidget {
  final MovieDetailModel movie ;
  const  MovieInfoRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Container(
          width: 122.w,
          height: 47.h,
          decoration: BoxDecoration(
              color: AppColor.darkGrey,
              borderRadius: BorderRadius.circular(16.r)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: AppColor.primary,))
            ],
          ),
       ),
        Container(
          width: 122.w,
          height: 47.h,
          decoration: BoxDecoration(
              color: AppColor.darkGrey,
              borderRadius: BorderRadius.circular(16.r)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.timer,color: AppColor.primary,size: 28.sp,)),
              Text(movie.movieDuration.toString(),style: AppTextStyle.boldWhite24.copyWith(fontSize: 20),)
            ],
          ),
        ), Container(
          width: 122.w,
          height: 47.h,
          decoration: BoxDecoration(
              color: AppColor.darkGrey,
              borderRadius: BorderRadius.circular(16.r)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.star_rate,size: 28.sp,color: AppColor.primary,)),
              Text(movie.voteAverage.toString(),style: AppTextStyle.boldWhite24.copyWith(fontSize: 20),)

            ],
          ),
        ),


      ]



    );
  }
}
