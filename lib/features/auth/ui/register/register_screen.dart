import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/core/widget/snack_bar.dart';
import 'package:movies_app/core/resources/validators.dart';
import 'package:movies_app/cubits/user_cubit/auth_states.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../cubits/user_cubit/auth_cubit.dart';
import '../custom_widgets/auth_redirirect_text_widget.dart';
import '../custom_widgets/avatar_custom_widget.dart';
import '../custom_widgets/custom_elevated_button.dart';
import '../custom_widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
int selectedIndex = 1;
final key = GlobalKey<FormState>();
late TextEditingController passController ;
late TextEditingController confirmPassController ;
late TextEditingController nameController ;
late TextEditingController emailController ;
late TextEditingController phoneController ;
@override
void initState() {
  super.initState();
  passController = TextEditingController();
  confirmPassController = TextEditingController();
  nameController = TextEditingController();
  emailController = TextEditingController();
  phoneController = TextEditingController();
}
  @override
  void dispose() {
  passController.dispose();
  confirmPassController.dispose();
  phoneController.dispose();
  emailController.dispose();
  nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: AppColor.primary,)),
        title: Text('Register', style: AppTextStyle.semiPrimary20,),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if(state is AuthErrorState){
            AppSnackBar.snackBar(context: context,color: AppColor.red, text: state.errMessage);
          }else if(state is AuthSuccessState){
      AppSnackBar.snackBar(context: context);
      Navigator.of(context).pushNamed(Routes.mainRoute);
          }else{
      Center(child: CircularProgressIndicator(),);
          }
        },
        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
            child: Column(
              children: [
                AvatarCustomWidget(),
                SizedBox(height: 24.h,),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                  child: Form(
                    key:key ,
                      child: Column(
                        spacing: 24.h,
                        children: [
                          CustomTextFormField(
                            controller: nameController,
                            validator: AppValidators.validateFullName,
                            hintText: 'Name',prefixIcon: Icon(Icons.perm_contact_cal_sharp,color: AppColor.white,size: 25.sp),),
                          CustomTextFormField(
                            controller: emailController,
                            keyBoardType: TextInputType.emailAddress,
                            validator: AppValidators.validateEmail,
                            hintText: 'Email',prefixIcon: Icon(Icons.email,color: AppColor.white,size: 25.sp),),
                          CustomTextFormField(
                            keyBoardType: TextInputType.visiblePassword,
                            controller:passController ,
                            suffixIcon:Icon(Icons.remove_red_eye) ,
                            validator: AppValidators.validatePassword,
                            hintText: 'Password',prefixIcon: Icon(Icons.lock,color: AppColor.white,size: 25.sp),),
                          CustomTextFormField(
                            keyBoardType: TextInputType.visiblePassword,
                            controller:confirmPassController ,
                            validator:(value){
                              return AppValidators.validateConfirmPassword(value, passController.text);
                            },
                            hintText: 'confirm Password',prefixIcon: Icon(Icons.lock,color: AppColor.white,size: 25.sp)
                            ,suffixIcon: Icon(Icons.remove_red_eye),),
                          CustomTextFormField(
                            controller: phoneController,
                            keyBoardType: TextInputType.phone,
                              validator: AppValidators.validatePhoneNumber,
                              hintText: 'Phone Number',prefixIcon: Icon(Icons.phone,color: AppColor.white,size: 25.sp,),
                              suffixIcon: Icon(Icons.remove_red_eye) ),
                          CustomElevatedButton(
                            textStyle: AppTextStyle.regBlack16,
                            onTap: () async {
                            if(key.currentState!.validate()){
                                await BlocProvider.of<AuthCubit>(context,listen: false).addUser(
                                  emailController: emailController,
                                  passController: passController,
                                  nameController: nameController,
                                  phoneController: phoneController,
                                );
                                // await SharedPrefsUtils.saveData(key: "isLoggedIn", value: true);
                            }
                          }, text: 'Create Account',),
                          AuthRedirectTextWidget(
                            onTap: (){
                            Navigator.pushNamed(context, Routes.signInRoute);
                          },text: 'Already Have Account ?',loginOrRegister: 'Login',)

                        ],
                      )
                  ),
                )
              ],
            ),
                    );
          }
        ),
      ),
    );
  }
}
