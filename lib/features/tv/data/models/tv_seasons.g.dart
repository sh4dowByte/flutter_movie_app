// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_seasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvSeasonImpl _$$TvSeasonImplFromJson(Map<String, dynamic> json) =>
    _$TvSeasonImpl(
      id: json['_id'] as String,
      airDate: json['air_date'] as String?,
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => TvEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num).toInt(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TvSeasonImplToJson(_$TvSeasonImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'air_date': instance.airDate,
      'episodes': instance.episodes,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
