
import '../../models/movies/movie_detail_model.dart';

class MovieState {
  final String selectedGenre;
  final List<MovieDetailModel> filteredMovies;

  const MovieState({
    required this.selectedGenre,
    required this.filteredMovies,
  });

  MovieState copyWith({
    String? selectedGenre,
    List<MovieDetailModel>? filteredMovies,
  }) {
    return MovieState(
      selectedGenre: selectedGenre ?? this.selectedGenre,
      filteredMovies: filteredMovies ?? this.filteredMovies,
    );
  }
}