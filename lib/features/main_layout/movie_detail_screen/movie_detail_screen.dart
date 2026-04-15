import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_cast_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_detail_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_genres_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_screenshot_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/similar_movies_widget.dart';
import '../../../models/movies/movie_detail_model.dart';
class MovieDetailScreen extends StatelessWidget {
  final MovieDetailModel movie;
  // final int index;
  const MovieDetailScreen({super.key,required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            MovieDetailWidget(movie : movie),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Screen Shots',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieScreenshotWidget(movie: movie),
                  SizedBox(height: 5.h,),
                  Text('Similar',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  SimilarMoviesWidget(movie : movie),
                  Text('Summary',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  Text(movie.summary,style: AppTextStyle.regWhit16,),
                  SizedBox(height: 5.h,),
                  Text('Cast',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieCastWidget(movie: movie),
                  Text('Genres',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieGenresWidget(movie: movie),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
