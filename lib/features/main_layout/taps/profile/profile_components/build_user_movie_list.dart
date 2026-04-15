import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../models/movies/movie_detail_model.dart';
GridView buildUserMoviesList (List<MovieDetailModel>  list){
  return  GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      // 👇 horizontal space between items
        crossAxisSpacing: 15.w,
        // 👇 vertical space between items
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.71,
        crossAxisCount: 2),
    itemCount:list.length ,
    itemBuilder: (context, index) {
      return  GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(Routes.detailScreenRoute,arguments: list[index]);
        },
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: Image.network(
            (list[index]).imagePath,
            fit: BoxFit.fill,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.white10,
              child: const Icon(Icons.broken_image, color: Colors.white38),
            ),
          ),
        ),
      );
    },
  );
}