import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/main_layout/taps/explore/view_model/browse_cubit.dart';
import 'package:movies_app/features/main_layout/taps/explore/widget/tap_widget.dart';

TabBar buildTapBar(BrowseCubit browseCubit){
  return TabBar(
    indicatorColor: Colors.transparent,
    dividerColor:Colors.transparent ,
    isScrollable: true,
    padding: EdgeInsets.zero,
    tabAlignment: TabAlignment.start,
    labelPadding: EdgeInsetsGeometry.symmetric(horizontal: 5.w),
    onTap: (index){
      browseCubit.changeIndex(index);
    },
    tabs: List.generate(
      browseCubit.allGenres.length,
          (index) {
        return tapWidget(
          isSelected:
          browseCubit.selectedIndex == index,
          genre: browseCubit.allGenres[index],
        );
      },
    ),
  );
}