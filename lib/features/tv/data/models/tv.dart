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
    @JsonKey(name: 'character') String? character,
    @JsonKey(name: 'first_air_date') required String firstAirDate,
    required String name,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _Tv;

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);
}
