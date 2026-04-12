
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatefulWidget {
  final TextEditingController passController;
  bool obscure;
  String? errorText;
  final void Function(void Function()) setDialogState;

  CustomTextField(
      {super.key, required this.passController, required this.obscure, this.errorText, required this.setDialogState});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: widget.passController,
      obscureText: widget.obscure,
      onChanged: (_) {
        if (widget.errorText != null) {
          widget.setDialogState(() =>widget.errorText = null);
        }
      },
      style: TextStyle(fontSize: 13.sp, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Enter your password',
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.25), fontSize: 13.sp),
        filled: true,
        fillColor: const Color(0xFF1a1a1a),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: Colors.white.withOpacity(0.12), width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: widget.errorText != null
                  ? const Color(0xFFA32D2D)
                  : Colors.white.withOpacity(0.12),
              width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
              color: widget.errorText != null
                  ? const Color(0xFFA32D2D)
                  : Colors.white.withOpacity(0.35),
              width: 0.5),
        ),
        suffixIcon: IconButton(
          onPressed: () => widget.setDialogState(() => widget.obscure = !widget.obscure),
          icon: Icon(
            widget.obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.white.withOpacity(0.3),
            size: 18.sp,
          ),
        ),
      ),
    );

  }
}
