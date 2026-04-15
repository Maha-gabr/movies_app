import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_assets.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/cubits/user_cubit/auth_cubit.dart';
import 'package:movies_app/cubits/user_cubit/auth_states.dart';

import '../../../../core/resources/app_color.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/resources/validators.dart';
import '../../../../core/widget/snack_bar.dart';
import '../custom_widgets/auth_redirirect_text_widget.dart';
import '../custom_widgets/custom_divider_custom.dart';
import '../custom_widgets/custom_elevated_button.dart';
import '../custom_widgets/custom_text_form_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passController ;
  late TextEditingController emailController ;
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passController= TextEditingController();
    emailController= TextEditingController();
  }
  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          AppSnackBar.snackBar(context: context, color: AppColor.red, text: state.errMessage);
        } else if (state is AuthSuccessState) {
          Navigator.of(context).pushNamed(Routes.mainRoute);
          AppSnackBar.snackBar(context: context, text: 'Welcome Back');
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return Scaffold(
            backgroundColor: AppColor.black,
            body: Center(child: CircularProgressIndicator(color: AppColor.grey)),
          );
        }
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal:19.w ,vertical:67.h ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 69.h,),
              Image.asset(AppAssets.mainLogo,),
              Form(
                key: key,
                child: Column(
                  children: [
                    SizedBox(height: 69.h,),
                    CustomTextFormField(
                      controller: emailController,
                      keyBoardType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                      hintText: 'Email',prefixIcon: Icon(Icons.email,color: AppColor.white,size: 25.sp),),
                    SizedBox(height: 24.h,),
                    CustomTextFormField(
                      keyBoardType: TextInputType.visiblePassword,
                      controller:passController ,
                      validator: AppValidators.validatePassword,
                      hintText: 'Password',prefixIcon: Icon(Icons.lock,color: AppColor.white,size: 25.sp),),
                    SizedBox(height: 24.h,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(Routes.forgetPassRoute);
                      },
                      child: Text('Forgot Password?',style: AppTextStyle.regPrimary14,))
                ],
              ),
              SizedBox(height: 24.h,),
               CustomElevatedButton(
                text: 'Login',
                textStyle: AppTextStyle.regBlack16,
                onTap: (){
                  if(key.currentState!.validate()){
                    context.read<AuthCubit>().signIn(email: emailController.text, password: passController.text);

                  }
              },
              ),
              SizedBox(height: 24.h,),
              AuthRedirectTextWidget(
                onTap: (){
                Navigator.pop(context);
              },text: 'Don’t Have Account ?' ,loginOrRegister: 'Create One',),
              SizedBox(height: 24.h,),
              CustomDividerCustom(),
              SizedBox(height: 24.h,),
               CustomElevatedButton(
                     text: ' Login With Google ',
                     haveIcon: true,
                     iconImagePath: AppAssets.googleIcon,
                     onTap: (){
                       context.read<AuthCubit>().signInWithGoogle();
                     },
                     textStyle: AppTextStyle.regBlack16,
                   ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
