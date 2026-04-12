import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/resources/app_text_style.dart';
import '../../../../movie_detail_model/movie_detail_model_response.dart';
class MovieCastWidget extends StatelessWidget {
  final int index;
  const MovieCastWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: Wrap(
          runSpacing: 10.w,
          children: MovieDetailModelResponse
              .movieDetail[index].cast.map((cast) {
            return  Container(
              height: 92.h,
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColor.darkGrey,
                  borderRadius: BorderRadiusGeometry.circular(22.r)
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                    child:
                    Image.network(
                      cast.image,
                      height: 70.h,
                      width: 70.w,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 70.h,
                          width: 70.w,
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
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name : ${cast.name}',style: AppTextStyle.regWhit16,),
                      Text('Character : ${cast.character}',style: AppTextStyle.regWhit16,)

                    ],
                  )
                ],
              ),

            );
          },).toList()
      ),
    );
  }
}
