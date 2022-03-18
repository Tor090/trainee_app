class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'] as int,
        posterPath: json['posterPath'] as String,
        title: json['title'] as String,
        overview: json['overview'] as String,
        releaseDate: json['releaseDate'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['posterPath'] = posterPath;
    data['overview'] = overview;
    data['releaseDate'] = releaseDate;
    return data;
  }
}
