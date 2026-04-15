import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../models/movies/movie_detail_model.dart';
import '../../models/user/my_user_model.dart';
class FirebaseUtils {
  //watch
  static CollectionReference<MovieDetailModel> watchMovieCollectionRef(String uid){
    return  userCollectionRef().doc(uid).collection(MovieDetailModel.watchCollectionName).withConverter<MovieDetailModel>(
      fromFirestore: (snapshot, options) => MovieDetailModel.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),);
  }
  //add watchMovies
  static Future<void> toggleWatchlist(String uid, MovieDetailModel movie) async {
    // Use the movie ID as the document ID for easy reference
    final docRef = watchMovieCollectionRef(uid).doc(movie.id);
    // movie.id =docRef.id;
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      // If it exists, remove it
      await docRef.delete();
      print("Movie removed from watchlist");
    } else {
      // If it doesn't exist, add it
      await docRef.set(movie);
      print("Movie added to watchlist");
    }
  }
  //history
  // static CollectionReference<MovieDetailModel> historyMovieCollectionRef(String uid){
  //   return  userCollectionRef().doc(uid).collection(MovieDetailModel.historyCollectionName).withConverter<MovieDetailModel>(
  //     fromFirestore: (snapshot, options) => MovieDetailModel.fromJson(snapshot.data()!),
  //     toFirestore: (value, options) => value.toJson(),);
  // }
  //add history movie
  // static Future<void> addHistoryMovieToFireStore(MovieDetailModel movie,String uid) async {
  //   DocumentReference<MovieDetailModel> docRef = historyMovieCollectionRef(uid).doc();
  //   return await docRef.set(movie);
  // }

  static Future<void> addToHistory(String uid, MovieDetailModel movie) async {
    final docRef = historyCollectionRef(uid).doc(movie.id);

    final doc = await docRef.get();

    if (!doc.exists) {
      await docRef.set({
        ...movie.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      });
    } else {
      // لو موجود ممكن نعمل update للوقت بس
      await docRef.update({
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  static Stream<List<MovieDetailModel>> getHistory(String uid) {
    return FirebaseUtils.historyCollectionRef(uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((e) => MovieDetailModel.fromJson(e.data()as Map<String, dynamic>)).toList());
  }

  static CollectionReference historyCollectionRef(String uid) {
    return userCollectionRef()
        .doc(uid)
        .collection(MovieDetailModel.historyCollectionName);
  }
  static CollectionReference<MyUser> userCollectionRef (){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter(
        fromFirestore: (snapshot, options) =>MyUser.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),);
  }
//add user to firestore
  static Future<void> addUser(MyUser myUser) async {
    return await  userCollectionRef().doc(myUser.id).set(myUser);
  }
//delete User
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