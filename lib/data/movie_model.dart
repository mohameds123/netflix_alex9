class MovieModel {
  final String title;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final int id;
  final List<int> genreIds;
  final String? posterPath;
  final String? backdropPath;
  final bool adult;
  final bool video;

  MovieModel({
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.id,
    required this.genreIds,
    this.posterPath,
    this.backdropPath,
    required this.adult,
    required this.video,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      id: json['id'] ?? 0,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
    );
  }
}