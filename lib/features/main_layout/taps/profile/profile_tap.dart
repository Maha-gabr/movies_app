import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_assets.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/cubits/user_cubit/auth_cubit.dart';
import 'package:movies_app/cubits/user_cubit/auth_states.dart';
import 'package:movies_app/cubits/user_movies_cubit/user_movies_cubit.dart';
import 'package:movies_app/cubits/user_movies_cubit/user_movies_states.dart';
import 'package:movies_app/features/main_layout/taps/profile/profile_components/profile_components.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/snack_bar.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});
  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final uid = context.read<AuthCubit>().myUser?.id;
      context.read<UserMovieCubit>().fetchHistory(uid??'');
      context.read<UserMovieCubit>().fetchWatchlist(uid??'');
    },);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          BlocBuilder<UserMovieCubit, UserMovieState>(
              builder: (context, state) {
                return BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    var user = context
                        .watch<AuthCubit>()
                        .myUser;
                    return ProfileComponents.buildHeader(
                      watchMovies: context.watch<UserMovieCubit>().watchMovies.length,
                      historyYMovies: context.watch<UserMovieCubit>().historyMovies.length,
                        name: user?.name ?? '',
                        avatar: user?.avatar ?? AppAssets.noProfile,
                    );
                  },
                );
              },
            ),
          SizedBox(height: 16.h),
          //
          BlocListener<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is SignOutSuccessState) {
                AppSnackBar.snackBar(
                  context: context,
                  color: AppColor.red,
                  text: 'Logged Out Successfully',
                );
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.signInRoute, (route) => false,
                );
              } else if (state is AuthErrorState) {
                AppSnackBar.snackBar(
                  context: context,
                  color: AppColor.red,
                  text: state.errMessage,
                );
              }
            },
            child: ProfileComponents.buildActionButtons(
                context, () async {
              await context.read<AuthCubit>().signOut();


            }),
          ),
          SizedBox(height: 8.h),
          ProfileComponents.buildTabBar(_tabController),
          BlocBuilder<UserMovieCubit, UserMovieState>(
  builder: (context, state) {
    final watchMovies = context.watch<UserMovieCubit>().watchMovies;
    final historyList = context.watch<UserMovieCubit>().historyMovies;
    return Expanded(
      child: ProfileComponents.buildTabContent(
        _tabController,
      historyList,
        watchMovies
            ),
    );
  },
),
        ],
      ),
    );
  }
}