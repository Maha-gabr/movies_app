import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/main_layout/taps/explore/view_model/movie_cubit.dart';
import '../../../../../core/routes_manager/routes.dart';
GridView buildFilteredList (MovieCubit browseCubit){
  return  GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      // 👇 horizontal space between items
        crossAxisSpacing: 15.w,
        // 👇 vertical space between items
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.7,
        crossAxisCount: 2),
    itemCount:browseCubit.filterList.length ,
    itemBuilder: (context, index) {
      return  GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(Routes.detailScreenRoute,arguments: browseCubit.filterList[index]);
        },
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: Image.network(
            (browseCubit.filterList[index]).imagePath,
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