import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/main_layout/taps/search/widget/custom_text_field.dart';

import '../../../../core/resources/app_color.dart';
import '../explore/view_model/movie_cubit.dart';
import '../explore/view_model/movie_state.dart';
import '../explore/widget/build_filtered_list.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 30.h, horizontal: 10.w),
        child: BlocProvider(
          create: (context) => MovieCubit(),
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              final bloc = context.watch<MovieCubit>();
              return Column(
                children: [
                  SizedBox(
                      height: 45,
                      child: customTextField(bloc)
                  ),
                  Expanded(
                    child:
                    buildFilteredList(bloc),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
