import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../../../core/resources/app_text_style.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../models/movies/movie_detail_model.dart';
import '../../../../auth/ui/custom_widgets/custom_elevated_button.dart';
import 'build_user_movie_list.dart';

class ProfileComponents{
  // ── Header ────────────────────────────────────────────────────────────────

 static  Widget buildHeader({required String name,  String? avatar, required int watchMovies, required int historyYMovies}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: 118.w,
                  height: 118.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.primary, width: 2.5),
                  ),
                  child: ClipOval(
                      child: Image.asset(avatar ?? AppAssets.avatar2,fit: BoxFit.cover,)
                  ),
                ),
              ),
              SizedBox(width: 20.w),

              // Stats
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildStat(watchMovies.toString(), 'Wish List'),
                    buildStat(historyYMovies.toString(), 'History'),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Name
          Text(
            name,
            style: AppTextStyle.regWhite15,
          ),
        ],
      ),
    );
  }

  static Widget buildStat(String count, String label) {
    return Column(
      children: [
        Text(
            count,
            style: AppTextStyle.boldWhite24.copyWith(fontSize: 20)
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style:AppTextStyle.boldWhite24.copyWith(fontSize: 17),
        ),
      ],
    );
  }

  // ── Action Buttons ────────────────────────────────────────────────────────

 static Widget buildActionButtons(BuildContext context, void Function()? onExitPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          // Edit Profile
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(Routes.updateProfileRoute);

              },
              child: CustomElevatedButton(text: 'Edit Profil', textStyle: AppTextStyle.regBlack20.copyWith(fontSize: 18) ,),
            ),
          ),
          SizedBox(width: 12.w),
          // Exit
          Expanded(
              flex: 1,
              child: CustomElevatedButton(
                onTap: onExitPressed,
                  color: AppColor.baseRed,text: 'Exite', textStyle: AppTextStyle.regBlack20.copyWith(color: AppColor.white,fontSize: 18)))
        ],
      ),
    );
  }

  // ── Tab Bar ───────────────────────────────────────────────────────────────

 static  Widget buildTabBar(TabController? tabController) {
    return TabBar(
      controller: tabController,
      indicatorColor: AppColor.primary,
      indicatorWeight: 2.5,
      labelColor: AppColor.primary,
      unselectedLabelColor: AppColor.white,
      dividerColor: Colors.white12,
      tabs: [
        Tab(
          icon: Icon(Icons.list_alt_rounded, size: 20.sp),
          text: 'Watch List',
          iconMargin: EdgeInsets.only(bottom: 4.h),
        ),
        Tab(
          icon: Icon(Icons.history_rounded, size: 20.sp),
          text: 'History',
          iconMargin: EdgeInsets.only(bottom: 4.h),
        ),
      ],
      labelStyle: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
    );
  }

  // ── Tab Content ───────────────────────────────────────────────────────────

  static Widget buildTabContent(TabController? tabController, List<MovieDetailModel> historyList, List<MovieDetailModel> watchList) {
    return TabBarView(
      controller: tabController,
      children: [
        buildUserMoviesList(watchList),
        // buildEmptyState(),  // Watch List tab — empty for now
        buildUserMoviesList(historyList),  // History tab — empty for now
      ],
    );
  }

 static Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Cinema/popcorn icon matching your screenshot
          Icon(
            Icons.local_movies_outlined,
            size: 80.sp,
            color: const Color(0xFFF5A623),
          ),
          SizedBox(height: 16.h),
          Text(
            'Nothing here yet',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

 static Future<dynamic> buildBottomSheet(BuildContext cotext){
    return showModalBottomSheet(
      context: cotext,
      constraints: BoxConstraints(maxHeight: 300.h),
      backgroundColor: AppColor.darkGrey,
      builder: (context) {
        return Wrap(
          spacing: 5.w,
          //use map
          children: [
            Text('data')
          ],
        );
      },
    );
  }
}