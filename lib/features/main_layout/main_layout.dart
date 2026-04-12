import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/main_layout/taps/explore/explore_tap.dart';
import 'package:movies_app/features/main_layout/taps/home/home_tap.dart';
import 'package:movies_app/features/main_layout/taps/profile/profile_tap.dart';
import 'package:movies_app/features/main_layout/taps/search/search_tap.dart';

import '../../core/resources/app_color.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tapes = [
    HomeTap(),
    SearchTap(),
    ExploreTap(),
    ProfileTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: tapes[currentIndex],
      // Column(
      //   children: [
      //     tapes[currentIndex]
      //   ],
      // ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 10.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: BottomNavigationBar(
            backgroundColor: AppColor.darkGrey,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index){
            setState(() {
              currentIndex = index;
            });
            },
            items:
            [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.saved_search_rounded),
                label: "",
              ),BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "",
              ),BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
            ],

          ),
        ),
      ),
    );
  }
}
