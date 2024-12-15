// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvCreditsImpl _$$TvCreditsImplFromJson(Map<String, dynamic> json) =>
    _$TvCreditsImpl(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TvCreditsImplToJson(_$TvCreditsImpl instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };
