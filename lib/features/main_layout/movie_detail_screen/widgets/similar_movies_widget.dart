import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_color.dart';
import '../../../../models/movies/movie_detail_model.dart';
import '../../../../models/movies/movie_detail_model_response.dart';
class SimilarMoviesWidget extends StatelessWidget {
  final MovieDetailModel movie ;
  const SimilarMoviesWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            child:
            Image.network(
              MovieDetailModelResponse.movieDetail[index+1].imagePath,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200.h,
                  width: double.infinity,
                  color: Colors.white10,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.baseRed,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (_, __, ___) => Container(
                color: Colors.white10,
                width: double.infinity,
                child: const Icon(Icons.broken_image, color: Colors.white38),
              ),
            ),
          );
        },),
    );
  }
}
