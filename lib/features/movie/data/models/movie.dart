// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'character') String? character,
    @JsonKey(name: 'release_date') required String releaseDate,
    required String title,
    bool? video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  // Tambahkan manual untuk mendukung fromMap
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie.fromJson(map);
  }
}

// Ekstensi untuk menambahkan getter imageUrl
extension MovieImageUrl on Movie {
// Tambahkan metode toMap
  Map<String, dynamic> toMapForFavorite() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  String _getImageUrl(String size, {bool isBackdrop = false}) {
    final path = isBackdrop ? backdropPath : posterPath;
    return 'https://image.tmdb.org/t/p/$size$path';
  }

  String get backdropUrlOriginal => _getImageUrl('original', isBackdrop: true);
  String get backdropUrlW500 => _getImageUrl('w500', isBackdrop: true);
  String get backdropUrlW300 => _getImageUrl('w300', isBackdrop: true);
  String get imageUrlOriginal => _getImageUrl('original');
  String get imageUrlW500 => _getImageUrl('w500');
  String get imageUrlW300 => _getImageUrl('w300');
  String get imageUrlW200 => _getImageUrl('w200');
}
