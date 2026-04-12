import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_cast_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_detail_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_genres_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_screenshot_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/similar_movies_widget.dart';
import '../../../movie_detail_model/movie_detail_model_response.dart';
class MovieDetailScreen extends StatelessWidget {
  final int index;
  const MovieDetailScreen({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            MovieDetailWidget(index : index),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Screen Shots',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieScreenshotWidget(index: index),
                  SizedBox(height: 5.h,),
                  Text('Similar',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  SimilarMoviesWidget(index : index),
                  Text('Summary',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  Text(MovieDetailModelResponse.movieDetail[index].summary,style: AppTextStyle.regWhit16,),
                  SizedBox(height: 5.h,),
                  Text('Cast',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieCastWidget(index: index),
                  Text('Genres',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieGenresWidget(index: index),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
