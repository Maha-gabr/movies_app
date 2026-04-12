class MovieDetailModel {
  String imagePath;
  String title;
  int year ;
  String summary;
  int movieDuration;
  List<String> genres;
  List<Cast> cast;
  List<String>? screenShot;
  int? likes;
  bool isFav;
  MovieDetailModel({required this.title,
    required this.year,
    required this.summary,
    required this.movieDuration,
    required this.genres,
    required this.cast,
    this.screenShot,
    this.likes =14,
    this.isFav= false,
  required this.imagePath,
  });
}
class Cast {
  String name;
  String image;
  String character;
  Cast({required this.name, required this.image, required this.character});
}