// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv.freezed.dart';
part 'tv.g.dart';

@freezed
class Tv with _$Tv {
  const factory Tv({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int id,
    @JsonKey(name: 'origin_country') required List<String> originCountry,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_name') required String originalName,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'first_air_date') required String firstAirDate,
    required String name,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _Tv;

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);
}

extension TvImageUrl on Tv {
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

  String get formattedAirDate {
    if (firstAirDate.isEmpty) {
      return 'Unknown release date';
    }
    try {
      final parsedDate = DateTime.parse(firstAirDate);
      // Return only the year
      return parsedDate.year.toString();
    } catch (e) {
      return 'Invalid release date';
    }
  }
}
