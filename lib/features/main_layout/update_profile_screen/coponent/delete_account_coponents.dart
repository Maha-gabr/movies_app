
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/user/my_user_model.dart';
import '../../../../cubits/user_cubit/auth_cubit.dart';
import 'customTextField.dart';
Future<void> deleteAccountConfirm(
BuildContext context,
MyUser myUser,
    AuthCubit authCubit
    ) async {
 final TextEditingController   passController = TextEditingController();
  bool obscure = true;
  String? errorText;
  await showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.6),
    builder: (ctx) => StatefulBuilder(
      builder: (context, setDialogState) {
        return AlertDialog(
          backgroundColor: const Color(0xFF242424),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.fromLTRB(18.w, 20.h, 18.w, 16.h),
          content:
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Trash icon ──
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF3d1a1a),
                    border: Border.all(color: const Color(0xFF7a2a2a)),
                  ),
                  child: Icon(Icons.delete_outline_rounded,
                      color: const Color(0xFFE24B4A), size: 22.sp),
                ),
                SizedBox(height: 12.h),
                // ── Title ──
                Text(
                  'Delete account?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                // ── Subtitle ──
                Text(
                  'Your account and all data will be permanently removed. You will be logged out immediately and cannot recover your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.45),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(passController: passController, obscure: obscure, setDialogState: setDialogState,),
                if (errorText != null) ...[
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.error_outline,
                          color: const Color(0xFFE24B4A), size: 13.sp),
                      SizedBox(width: 4.w),
                      Text(
                        errorText!,
                        style: TextStyle(
                            fontSize: 11.sp, color: const Color(0xFFE24B4A)),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 14.h),
                // ── Buttons ──
                Row(
                  children: [
                    Expanded(
                      child:
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.1), width: 0.5),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                        ),
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    //delete btn
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          // ✅ Validate before proceeding
                          if (passController.text.trim().isEmpty) {
                            setDialogState(
                                    () => errorText = 'Password cannot be empty');
                            return;
                          }else if(passController.text.trim() != myUser.pass){
                            setDialogState(
                                    () => errorText = 'Wrong-Password');
                            return;
                          }
                          Navigator.pop(context);
                          await authCubit.deleteAccount(passController.text.trim());
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFA32D2D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                        ),
                        child: Text('Delete',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}



// Future<void> _performDelete(String password, MyUser currentUser) async {
//   try {
//     final user = FirebaseAuth.instance.currentUser!;
//
//     // 1️⃣ Re-authenticate
//     final credential = EmailAuthProvider.credential(
//       email: currentUser.email,
//       password: password,
//     );
//     await user.reauthenticateWithCredential(credential);
//
//     // 2️⃣ Optional: delete user data from Firestore first
//     await FirebaseFirestore.instance
//         .collection(MyUser.collectionName)
//         .doc(currentUser.id)
//         .delete();
//
//     // 3️⃣ Delete auth account
//     await user.delete();
//
//     // 4️⃣ Navigate to login
//     Navigator.of(context).pushNamedAndRemoveUntil(
//       Routes.signInRoute,
//           (route) => false,
//     );
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'wrong-password') {
//       // show error to user
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Wrong password')),
//       );
//     } else if (e.code == 'requires-recent-login') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please log out and log in again first')),
//       );
//     }
//   }
// }




// ── Password field ──
// TextField(
//   controller: passController,
//   obscureText: obscure,
//   onChanged: (_) {
//     if (errorText != null) {
//       setDialogState(() => errorText = null);
//     }
//   },
//   style: TextStyle(fontSize: 13.sp, color: Colors.white),
//   decoration: InputDecoration(
//     hintText: 'Enter your password',
//     hintStyle: TextStyle(
//         color: Colors.white.withOpacity(0.25), fontSize: 13.sp),
//     filled: true,
//     fillColor: const Color(0xFF1a1a1a),
//     contentPadding:
//     EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(
//           color: Colors.white.withOpacity(0.12), width: 0.5),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(
//           color: errorText != null
//               ? const Color(0xFFA32D2D)
//               : Colors.white.withOpacity(0.12),
//           width: 0.5),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(
//           color: errorText != null
//               ? const Color(0xFFA32D2D)
//               : Colors.white.withOpacity(0.35),
//           width: 0.5),
//     ),
//     suffixIcon: IconButton(
//       onPressed: () => setDialogState(() => obscure = !obscure),
//       icon: Icon(
//         obscure ? Icons.visibility_off : Icons.visibility,
//         color: Colors.white.withOpacity(0.3),
//         size: 18.sp,
//       ),
//     ),
//   ),
// ),
// ── Error message ──
