import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_assets.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/cubits/user_cubit/auth_cubit.dart';
import 'package:movies_app/cubits/user_cubit/auth_states.dart';
import '../../../../core/resources/app_text_style.dart';
import '../../../../core/resources/validators.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/snack_bar.dart';
import '../custom_widgets/custom_elevated_button.dart';
import '../custom_widgets/custom_text_form_field.dart';
class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
final TextEditingController emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();
@override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Text('Forget Password', style: AppTextStyle.regPrimary14,),
        leading: IconButton(onPressed: () {Navigator.pop(context);  }, icon: Icon(Icons.arrow_back_outlined,color: AppColor.primary,) ,),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            AppSnackBar.snackBar(context: context, text: 'Sending email...');
          } else if (state is ResetPasswordSuccessState) {
            AppSnackBar.snackBar(context: context, text: 'Check your email!');
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
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Scaffold(
              backgroundColor: AppColor.black,
              body: Center(child: CircularProgressIndicator(color: AppColor.grey)),
            );
          }
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.forgetPassIcon, fit: BoxFit.cover,),
              SizedBox(height: 24.h,),
              Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    keyBoardType: TextInputType.emailAddress,
                      validator: AppValidators.validateEmail,
                      hintText: 'Email',
                      controller: emailController,
                      prefixIcon: Icon(Icons.email,color: AppColor.primary,))
              ),
              SizedBox(height: 24.h,),
              CustomElevatedButton(
                onTap: (){
                  if (_formKey.currentState!.validate()){
                    context.read<AuthCubit>().resetPassword(emailController.text);
                  }
                },
                text: 'Verify Email',textStyle: AppTextStyle.regBlack16,),
            ],
          ),
        ),
      );
  },
),
    );
  }
}
