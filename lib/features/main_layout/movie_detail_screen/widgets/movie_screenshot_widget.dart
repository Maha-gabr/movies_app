import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_color.dart';
import '../../../../models/movies/movie_detail_model.dart';
class MovieScreenshotWidget extends StatelessWidget {
  final MovieDetailModel movie;
  const MovieScreenshotWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 10.h,
        children: List.generate(movie.screenShot?.length??3, (screenShotIndex) {
          return
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child:
              GestureDetector(
                onTap: (){

                },
                child: Image.network(
                  movie.screenShot?[screenShotIndex] ?? '',
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 265.h,
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
              ),
            );
        },).toList()
    )
    ;
  }
}
