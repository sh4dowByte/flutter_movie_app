class Favorite {
  final int? favId; // Optional untuk auto-increment
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String overview;
  final double? popularity;
  final String date;
  final double voteAverage;
  final String? type;
  final int voteCount;

  // Constructor
  Favorite({
    this.favId,
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    required this.overview,
    this.popularity,
    required this.date,
    required this.voteAverage,
    this.type,
    required this.voteCount,
  });

  // Convert object to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'fav_id': favId,
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'popularity': popularity,
      'date': date,
      'vote_average': voteAverage,
      'type': type,
      'vote_count': voteCount,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      favId: map['fav_id'],
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
      popularity: map['popularity'],
      date: map['date'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }

  // Create Favorite object from Map (for movie data)
  factory Favorite.fromMapMovie(Map<String, dynamic> map) {
    return Favorite(
      favId: map['fav_id'],
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
      popularity: map['popularity'],
      date: map['release_date'],
      voteAverage: map['vote_average'],
      type: 'movie', // Explicitly set type as "movie"
      voteCount: map['vote_count'],
    );
  }

  // Create Favorite object from Map (for series data)
  factory Favorite.fromMapSeries(Map<String, dynamic> map) {
    return Favorite(
      favId: map['fav_id'],
      id: map['id'],
      title: map['name'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
      popularity: map['popularity'],
      date: map['last_air_date'],
      voteAverage: map['vote_average'],
      type: 'series', // Explicitly set type as "series"
      voteCount: map['vote_count'],
    );
  }
}
