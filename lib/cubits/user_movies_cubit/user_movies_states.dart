import '../../models/movies/movie_detail_model.dart';

abstract class UserMovieState {}

class UserMovieInitial extends UserMovieState {}

class UserMovieLoading extends UserMovieState {}

class WatchMovieSuccess extends UserMovieState {
  final List<MovieDetailModel> movies;
  WatchMovieSuccess(this.movies);
}
class HistoryMovieSuccess extends UserMovieState {
  final List<MovieDetailModel> movies;
  HistoryMovieSuccess(this.movies);
}

class UserMovieError extends UserMovieState {
  final String message;
  UserMovieError(this.message);
}