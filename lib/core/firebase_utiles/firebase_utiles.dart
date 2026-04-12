
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/movie_detail_model/my_user_model.dart';

class FirebaseUtils {

  static CollectionReference<MyUser> userCollectionRef (){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter(
        fromFirestore: (snapshot, options) =>MyUser.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),);
  }

  static Future<void> addUser(MyUser myUser) async {
    return await  userCollectionRef().doc(myUser.id).set(myUser);
  }

  static Future<void> deleteUser(MyUser? currentUser , String password, User fireBaseUser) async {
    final user = FirebaseAuth.instance.currentUser!;

    // 1️⃣ Re-authenticate
    final credential = EmailAuthProvider.credential(
      email: currentUser!.email,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);

    // 2️⃣ Optional: delete user data from Firestore first
    await FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .doc(currentUser.id)
        .delete();

    // 3️⃣ Delete auth account
    await fireBaseUser.delete();

  }
// update user ;
  static Future<void> updateUser(MyUser myUser) async {
    return await userCollectionRef().doc(myUser.id).update(myUser.toJson());
  }
// reset pass
  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
//login

  static Future<MyUser?> getUser(String uid) async {
    final doc = await userCollectionRef().doc(uid).get();
    return doc.data();
  }
  //login with google
  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}