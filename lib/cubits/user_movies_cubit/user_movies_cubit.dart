import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/firebase_utiles/firebase_utiles.dart';
import 'package:movies_app/cubits/user_movies_cubit/user_movies_states.dart';
import 'package:movies_app/models/movies/movie_detail_model.dart';
class UserMovieCubit extends Cubit<UserMovieState> {
  StreamSubscription? _subscription;
  UserMovieCubit() : super(UserMovieInitial());
List<MovieDetailModel> watchMovies=[];
  void fetchWatchlist(String uid) {
    emit(UserMovieLoading());
    // Cancel any existing listener before starting a new one
    _subscription?.cancel();
    _subscription = FirebaseUtils.watchMovieCollectionRef(uid).snapshots().listen(
          (snapshot) {
        // snapshot.docs is a List<QueryDocumentSnapshot<MovieDetailModel>>
            watchMovies = snapshot.docs.map((doc) => doc.data()).toList();
        emit(WatchMovieSuccess(watchMovies));
      },
      onError: (error) {
        emit(UserMovieError(error.toString()));
      },
    );
  }
  List<MovieDetailModel> historyMovies = [];

  StreamSubscription? _historySub;

  void fetchHistory(String uid) {
    _historySub?.cancel();
    _historySub = FirebaseUtils.getHistory(uid).listen(
          (movies) {
        historyMovies = movies;
        emit(HistoryMovieSuccess(movies));
      },
      onError: (e) {
        emit(UserMovieError(e.toString()));
      },
    );
  }


  @override
  Future<void> close() {
    _subscription?.cancel();
    _historySub?.cancel();
    return super.close();
  }
}