
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/core/widget/snack_bar.dart';
import 'package:movies_app/cubits/user_cubit/auth_cubit.dart';
import 'package:movies_app/cubits/user_cubit/auth_states.dart';
import 'package:movies_app/features/auth/ui/custom_widgets/custom_elevated_button.dart';
import 'package:movies_app/features/auth/ui/custom_widgets/custom_text_form_field.dart';
import 'package:movies_app/features/main_layout/update_profile_screen/coponent/build_avatar.dart';
import 'package:movies_app/features/main_layout/update_profile_screen/coponent/delete_account_coponents.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/validators.dart';
import '../../../core/routes_manager/routes.dart';
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String selectedAvatar ='';
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: AppColor.primary,)),
        title: Text('Pick Avatar',style: AppTextStyle.regPrimary16,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
        child:
       SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
SizedBox(height: 30.h,),
buildAvatarGestureDetector(
  context,
    context.watch<AuthCubit>().myUser?.avatar ?? AppAssets.noProfile
),
Form(
  key: _formKey,
  child: Column(
    children: [
      SizedBox(height: 15.h,),
      CustomTextFormField(hintText: 'name', prefixIcon: Icon(Icons.person,),controller: nameController,validator: AppValidators.validateFullName,),
      SizedBox(height: 15.h,),
      CustomTextFormField(
        hintText: 'phone',
        keyBoardType:TextInputType.phone ,
        prefixIcon: Icon(Icons.phone,),
        controller: phoneController,
        validator: AppValidators.validatePhoneNumber,),
    ],
  ),
),
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
     GestureDetector(
        onTap: ()  {
          Navigator.of(context).pushNamed(Routes.forgetPassRoute);
        },
        child: Text('Reset Password',style: AppTextStyle.regWhit16,textAlign: TextAlign.start,)),
  ],
),
SizedBox(height:340.h ,),
            BlocListener<AuthCubit, AuthStates>(
              listener: (context, state) {
                if(state is DeleteUserSuccess){
                  AppSnackBar.snackBar(context: context, text: 'Account Deleted Succesfully');
                  Navigator.of(context).pushNamedAndRemoveUntil(Routes.signInRoute, (route) => false);}
                if(state is DeleteUserError){
                  AppSnackBar.snackBar(
                    context: context,
                    text: state.errMessage,
                    color: AppColor.red,
                  );
                }
              },
  child: CustomElevatedButton(
              text: 'Delete Account',
              textStyle: AppTextStyle.regWhit16,
              color: AppColor.baseRed,
              onTap: () async {
                var user =BlocProvider.of<AuthCubit>(context,listen: false);
                await deleteAccountConfirm(
                    context ,
                    user.myUser!,
                    BlocProvider.of<AuthCubit>(context,listen: false)
                );}
              ,),
),
            SizedBox(height: 10.h,),
            BlocListener<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is UpdateUserLoading) {
                  AppSnackBar.snackBar(context: context, text: 'Updating...');
                } else if (state is UpdateUserSuccess) {
                  AppSnackBar.snackBar(context: context, text: 'Updated Successfully');
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.mainRoute, (route) => false,
                  );
                } else if (state is UpdateUserError) {
                  AppSnackBar.snackBar(
                    context: context,
                    color: AppColor.red,
                    text: state.errMessage,
                  );
                }
              },
  child: CustomElevatedButton(
              text: 'Update Data',
              textStyle: AppTextStyle.regBlack16,
              color: AppColor.primary,
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await context.read<AuthCubit>().updateUser(name: nameController.text, phone: phoneController.text);
                }
              },
            ),
),
          ],
        ),
      )

,),);}

}
