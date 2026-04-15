import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/movies/movie_detail_model.dart';
import '../../../../../models/movies/movie_detail_model_response.dart';
import 'movie_state.dart';
class MovieCubit extends Cubit<MovieState> {
  MovieCubit()
      : super(MovieState(
    selectedGenre: 'All',
    filteredMovies: MovieDetailModelResponse.movieDetail,
  ),
  ){
    applyFilter();
  }
  /// All unique genres extracted from movie data, "All" always first
  List<String> get allGenres {
    return [
      'All',
      ...{
        ...MovieDetailModelResponse.movieDetail.expand((m) => m.genres),
      }.toList()..sort(),
    ];
  }
int selectedIndex =0;
  void changeIndex(int index) {
    selectedIndex = index;
    applyFilter();
    emit(state.copyWith(
      selectedGenre: allGenres[index],
    ));
  }
  List<MovieDetailModel> filterList = [];
  void applyFilter() {
    final selectedGenre = allGenres[selectedIndex];
    if (selectedIndex == 0) {
      filterList = MovieDetailModelResponse.movieDetail;
    } else {
      filterList = MovieDetailModelResponse.movieDetail
          .where((movie) => movie.genres.contains(selectedGenre))
          .toList();
    }
    emit(state.copyWith(
      filteredMovies: filterList,
    ));
  }

  void searchByMovieName(String query) {
    final text = query.trim().toLowerCase();

     filterList = text.isEmpty
        ? MovieDetailModelResponse.movieDetail
        : MovieDetailModelResponse.movieDetail.where((movie) {
      return movie.title.toLowerCase().contains(text);
    }).toList();

    emit(state.copyWith(
      filteredMovies: filterList,
    ));
  }


}