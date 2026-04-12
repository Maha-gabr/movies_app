import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
class AuthRedirectTextWidget extends StatelessWidget {
  final String text ;
  final String loginOrRegister ;

  final void Function()? onTap;
  const AuthRedirectTextWidget({super.key, required this.text,required this.onTap, required this.loginOrRegister});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: AppTextStyle.regWhite14,),
        TextButton(onPressed: onTap, child: Text(loginOrRegister,style: AppTextStyle.regPrimary14,))

      ],
    );
  }
}
