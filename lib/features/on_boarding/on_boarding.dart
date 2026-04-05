import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/features/on_boarding/model/on_boarding_model.dart';
import '../../core/resources/app_color.dart';
import '../../core/routes_manager/routes.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  PageController? _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController= PageController();
  }
  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onBoardingList = OnBoardingModel.getOnBoardingList;
    return Scaffold(
      body: PageView.builder(
        controller:_pageController,
          onPageChanged: (index) {
            setState(()  {
              _currentIndex = index;
            });
          },
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
              Image.asset(
                onBoardingList[index].image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 15.h),
                  width: double.infinity,
                  // height: 333.h,
                  decoration: BoxDecoration(
                      color: index ==0 ?
                      Colors.transparent
                          :AppColor.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                  ),
                  child: Column(
                    spacing: 17.h,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Text(onBoardingList[index].title, style: AppTextStyle.boldWhite24,textAlign: TextAlign.center,),
                      Text(onBoardingList[index].description ,style: AppTextStyle.regGrey20,textAlign: TextAlign.center,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary
                          ,
                          minimumSize: Size(double.infinity, 55.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        onPressed: () {
                          if (_currentIndex < OnBoardingModel.getOnBoardingList.length - 1) {
                            _pageController?.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacementNamed(context, Routes.signInRoute);
                          }

                          },
                        child: index!=5
                            ?Text('Next',style: AppTextStyle.semiBlack20,)
                            :Text('Finish',style: AppTextStyle.semiBlack20,)
                      ),
                      index!=0?
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          minimumSize: Size(double.infinity, 55.h),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColor.primary),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        onPressed: () {
                          _pageController?.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                        child: Text('Back',style: AppTextStyle.semiPrimary20,),

                      )
                        :SizedBox.shrink(),


                    ],
                  ),
                )
              ],
            );
          },
      )
    );
  }
}
