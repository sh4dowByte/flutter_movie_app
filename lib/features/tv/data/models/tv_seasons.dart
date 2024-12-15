// ignore_for_file: invalid_annotation_target

import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_seasons.freezed.dart';
part 'tv_seasons.g.dart';

@freezed
class TvSeason with _$TvSeason {
  const factory TvSeason({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'air_date') String? airDate,
    required List<TvEpisode> episodes,
    required String name,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'season_number') required int seasonNumber,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _TvSeason;

  factory TvSeason.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonFromJson(json);
}
