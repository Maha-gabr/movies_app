import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_color.dart';
import '../../explore/view_model/movie_cubit.dart';

TextField customTextField (MovieCubit browseCubit){
  return TextField(
    onChanged: (value) {
      browseCubit.searchByMovieName(value);
    },
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColor.darkGrey,
      hintText: 'Search',
      hintStyle: const TextStyle(color: Colors.white38),
      prefixIcon: const Icon(Icons.search, color: AppColor.white),
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
    ),
  );
}