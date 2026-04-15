class Cast {
  final String name;
  final String image;
  final String character;

  const Cast({
    required this.name,
    required this.image,
    required this.character,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] as String,
      image: json['image'] as String,
      character: json['character'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'character': character,
    };
  }
}

class MovieDetailModel {
  static const String collectionName = 'movies';

  final String id;
  final String title;
  final String imagePath;
  final int year;
  final String summary;
  final int movieDuration;
  final List<String> genres;
  final double voteAverage;
  final List<String> screenShot;
  final List<Cast> cast;
  final bool isFav;

  const MovieDetailModel({
     this.id ='',
    required this.title,
    required this.imagePath,
    required this.year,
    required this.summary,
    required this.movieDuration,
    required this.genres,
    this.voteAverage = 0.0,
    this.screenShot = const [],
    this.cast = const [],
    this.isFav = false,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      year: json['year'] as int,
      summary: json['summary'] as String,
      movieDuration: json['movieDuration'] as int,
      genres: List<String>.from(json['genres'] as List),
      voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0.0,
      screenShot: List<String>.from(json['screenShot'] as List? ?? []),
      cast: (json['cast'] as List? ?? [])
          .map((e) => Cast.fromJson(e))
          .toList(),
      isFav: json['isFav'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'year': year,
      'summary': summary,
      'movieDuration': movieDuration,
      'genres': genres,
      'voteAverage': voteAverage,
      'screenShot': screenShot,
      'cast': cast.map((e) => e.toJson()).toList(),
      'isFav': isFav,
    };
  }
}