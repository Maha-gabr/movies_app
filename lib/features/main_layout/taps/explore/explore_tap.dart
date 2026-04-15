import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/cubits/movie_cubit/movie_cubit.dart';
import 'package:movies_app/cubits/movie_cubit/movie_state.dart';
import 'package:movies_app/features/main_layout/taps/explore/widget/build_tap_bar.dart';
import 'package:movies_app/features/main_layout/taps/explore/widget/build_filtered_list.dart';
class ExploreTap extends StatefulWidget {
  const ExploreTap({super.key});
  @override
  State<ExploreTap> createState() => _ExploreTapState();
}
class _ExploreTapState extends State<ExploreTap>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: BlocProvider(
        create: (context) => MovieCubit(),
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            final browseCubit = context.watch<MovieCubit>();
            return Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 5.w,vertical: 25.h),
              child: Column(
                children: [
                  DefaultTabController(
                    length: browseCubit.allGenres.length,
                    child: buildTapBar(browseCubit),
                  ),
                 Expanded(
                     child:
                     buildFilteredList(browseCubit)
                 )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}