// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String?,
      mediaType: json['media_type'] as String?,
      adult: json['adult'] as bool,
      popularity: (json['popularity'] as num).toDouble(),
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'popularity': instance.popularity,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'place_of_birth': instance.placeOfBirth,
      'also_known_as': instance.alsoKnownAs,
    };
