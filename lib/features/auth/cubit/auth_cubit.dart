import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/features/auth/cubit/auth_states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/firebase_utiles/firebase_utiles.dart';
import '../../../models/user/my_user_model.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit():super(AuthInitState());
  MyUser? myUser;
  User? firebaseUser;
  String avatar ='';
  void changeAvatar(String newAvatar){
    avatar = newAvatar;
    emit(ChangeAvatarState(avatar: avatar));
  }

  Future<void> addUser({
    required TextEditingController emailController,
    required TextEditingController passController,
    required TextEditingController nameController,
    required TextEditingController phoneController,
  }) async {
    try {
      emit(AuthLoadingState());
       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
       firebaseUser = credential.user;
      // add user to fire auth , update user
       myUser = MyUser(
          name: nameController.text,
          email: emailController.text,
          id: credential.user!.uid,
      phone: phoneController.text,
         avatar: avatar,
         pass: passController.text
      );
      // add user to fire store
      await FirebaseUtils.addUser(myUser!);
      emit(AuthSuccessState())        ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState(errMessage:'The password provided is too weak.' ));
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState(errMessage:'Email already In Use' ));
      }
    } catch (e) {
      emit(AuthErrorState(errMessage:'Error' ));

    }
  }
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      firebaseUser = credential.user;
      myUser = await FirebaseUtils.getUser(firebaseUser!.uid);

      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
        emit(AuthErrorState(errMessage: 'Invalid email or password'));
      // } else if (e.code == 'wrong-password') {
      //   emit(AuthErrorState(errMessage: 'Wrong password'));
      // } else {
      //   emit(AuthErrorState(errMessage: e.message ?? 'Error'));
      // }

  }}

  //login with google
  //remember to add finger print in firebase (SHA1)
  Future<void> signInWithGoogle() async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseUtils.signInWithGoogle();

      //if user doesnt choose any account and return
      if (credential == null) {
        emit(AuthInitState()); // ← رجعي للحالة الأولى بدون error
        return;
      }
      firebaseUser = credential.user;
      // تحققي لو الـ user موجود في Firestore
      myUser = await FirebaseUtils.getUser(firebaseUser!.uid);
      // لو مش موجود → اعمليه جديد
      if (myUser == null) {
        myUser = MyUser(
          name: firebaseUser!.displayName ?? 'No Name',
          email: firebaseUser!.email ?? '',
          id: firebaseUser!.uid,
          phone: '',
          avatar: '',
          pass: '',
        );
        await FirebaseUtils.addUser(myUser!);
      }
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      print('🚩🚩🚩');
      emit(AuthErrorState(errMessage: e.message ?? 'fire Google Sign-In failed'));
    } catch (e) {
      print(e.toString());
      print('🚩🚩🚩');
      emit(AuthErrorState(errMessage: 'Google Sign-In failed'));
    }
  }
  Future<void> signOut() async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut(); // ← مهم لو استخدم Google
      myUser = null;
      firebaseUser = null;
      emit(SignOutSuccessState());
    } catch (e) {
      emit(AuthErrorState(errMessage: 'Sign out failed'));
    }
  }
  Future<void> deleteAccount(String pass) async {
    emit(DeleteUserLoading());
    try{
      firebaseUser ??= FirebaseAuth.instance.currentUser;

      if (firebaseUser == null || myUser == null) {
        emit(DeleteUserError(errMessage: 'User session expired, please log in again'));
        return;
      }
      await FirebaseUtils.deleteUser(myUser!, pass, firebaseUser!); // 👈 pass it
      emit(DeleteUserSuccess());
      print('deleted successfully 🚩🚩🚩');
    }on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        // show error to user
        emit(DeleteUserError(errMessage: e.code));
      } else if (e.code == 'requires-recent-login') {
        emit(DeleteUserError(errMessage: ' Please log out and log in again first'));


      }
    }
  }

  Future<void> updateUser({
    required String name,
    required String phone,
    String? newAvatar,
  }) async {
    emit(UpdateUserLoading());
    try {
      myUser = myUser!.copyWith(
        name: name,
        phone: phone,
        avatar: newAvatar ?? myUser!.avatar,
      );
      await FirebaseUtils.updateUser(myUser!);
      emit(UpdateUserSuccess());
    } catch (e) {
      emit(UpdateUserError(errMessage: 'Update failed'));
    }
  }

  //reset pass
  Future<void> resetPassword(String email) async {
    emit(AuthLoadingState());
    try {
      await FirebaseUtils.resetPassword(email);
      emit(ResetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(errMessage: e.message ?? 'Error'));
    }
  }
}