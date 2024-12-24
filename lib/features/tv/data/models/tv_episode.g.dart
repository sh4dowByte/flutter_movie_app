// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvEpisodeImpl _$$TvEpisodeImplFromJson(Map<String, dynamic> json) =>
    _$TvEpisodeImpl(
      airDate: json['air_date'] as String?,
      episodeNumber: (json['episode_number'] as num).toInt(),
      episodeType: json['episode_type'] as String?,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String?,
      productionCode: json['production_code'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num).toInt(),
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guest_stars'] as List<dynamic>?)
          ?.map((e) => GuestStar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TvEpisodeImplToJson(_$TvEpisodeImpl instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'crew': instance.crew,
      'guest_stars': instance.guestStars,
    };
