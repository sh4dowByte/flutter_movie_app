// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_star.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestStarImpl _$$GuestStarImplFromJson(Map<String, dynamic> json) =>
    _$GuestStarImpl(
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: (json['order'] as num).toInt(),
      adult: json['adult'] as bool,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$GuestStarImplToJson(_$GuestStarImpl instance) =>
    <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
