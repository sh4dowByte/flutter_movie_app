// ignore_for_file: invalid_annotation_target

import 'package:flutter_movie_app/features/people/data/models/crew.dart';
import 'package:flutter_movie_app/features/people/data/models/guest_star.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_episode.freezed.dart';
part 'tv_episode.g.dart';

@freezed
class TvEpisode with _$TvEpisode {
  const factory TvEpisode({
    @JsonKey(name: 'air_date') String? airDate,
    @JsonKey(name: 'episode_number') required int episodeNumber,
    @JsonKey(name: 'episode_type') String? episodeType,
    required int id,
    required String name,
    String? overview,
    @JsonKey(name: 'production_code') String? productionCode,
    int? runtime,
    @JsonKey(name: 'season_number') required int seasonNumber,
    // @JsonKey(name: 'show_id') int? showId,
    @JsonKey(name: 'still_path') String? stillPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    required List<Crew> crew,
    @JsonKey(name: 'guest_stars') required List<GuestStar> guestStars,
  }) = _TvEpisode;

  factory TvEpisode.fromJson(Map<String, dynamic> json) =>
      _$TvEpisodeFromJson(json);
}
