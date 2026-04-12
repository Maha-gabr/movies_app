import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_assets.dart';
import 'package:movies_app/core/resources/app_text_style.dart';

import '../../../../core/routes_manager/routes.dart';
import '../../../../movie_detail_model/movie_detail_model_response.dart';
class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.homeBg),fit: BoxFit.fill,),),
      child: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 110.h,),
            CarouselSlider.builder(
                itemCount: MovieDetailModelResponse.movieDetail.length,
                options: CarouselOptions(
                  height: 340.h,
                  aspectRatio: 16/9,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.59.w,
                ),
                itemBuilder: (context, index, realIndex) {
                  return  Builder(builder: (context) {
                      return ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16.r),
                        child: Image.network(
                          height: 265.h,
                          width: double.infinity,
                          MovieDetailModelResponse.movieDetail[index].imagePath,
                          fit: BoxFit.fill,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.white10,
                            width: double.infinity,
                            child: const Icon(Icons.broken_image, color: Colors.white38),
                          ),
                        ),
                      );
                    }
                  );
                    // Image.asset(MovieDetailModelResponse.movieDetail[index].imagePath,fit: BoxFit.fill,width: 230.w,);
                },
            ),
            SizedBox(height: 130.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Action', style: AppTextStyle.regWhite14,),
                  Text('See More', style: AppTextStyle.regPrimary16,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              height: 200.h,
        
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: MovieDetailModelResponse.movieDetail.length,
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsetsGeometry.symmetric(horizontal: 5.w),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(Routes.detailScreenRoute,arguments: index);},
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16.r),
                          child: Image.network(
                            height: 100.h,
                            // width: double.infinity,
                            (MovieDetailModelResponse.movieDetail[index]).imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.white10,
                              // width: double.infinity,
                              child: const Icon(Icons.broken_image, color: Colors.white38),
                            ),
                          ),
                        )));
              },),
            )
        
        
          ],
        ),
      ),
    );
  }
}
