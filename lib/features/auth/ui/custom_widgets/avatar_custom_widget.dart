import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_constant.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/cubit/auth_states.dart';

import '../../../../core/resources/app_assets.dart';

class AvatarCustomWidget extends StatefulWidget {
  const AvatarCustomWidget({super.key,});
  @override
  State<AvatarCustomWidget> createState() => _AvatarCustomWidgetState();
}

class _AvatarCustomWidgetState extends State<AvatarCustomWidget> {
    int selectedAvatar =0;

  @override
  Widget build(BuildContext context) {
    // List<String> avatarList = [AppAssets.avatar1,AppAssets.avatar2,AppAssets.avatar3, AppAssets.avatar1];

    return  Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            AppConstant.avatarList.length,
                (index) {
              return BlocBuilder<AuthCubit, AuthStates>(
  builder: (context, state) {
    return GestureDetector(
                onTap: (){
                  context.read<AuthCubit>().changeAvatar(AppConstant.avatarList[index]);
                  print(context.read<AuthCubit>().avatar);
                  print('🚩🚩🚩🚩');
                  setState(() {
                    selectedAvatar = index;
                  });
                },
                child: Container(
                    margin: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                    child: selectedAvatar != index
                        ? Image.asset(AppConstant.avatarList[index],width: 94.w,height: 94.h,)
                        : Image.asset(AppConstant.avatarList[index],width: 161.w,height: 161.h,)
                ) ,
              );
  },
);
            },
          ),
        ),
      ),
    );
  }
}
