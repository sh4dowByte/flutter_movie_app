// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
class Actor with _$Actor {
  const factory Actor({
    required int id,
    required String name,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'media_type') String? mediaType,
    required bool adult,
    required double popularity,
    required int gender,
    @JsonKey(name: 'known_for_department') String? knownForDepartment,
    @JsonKey(name: 'profile_path') String? profilePath,
    String? biography,
    String? birthday,
    String? deathday,
    String? homepage,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'place_of_birth') String? placeOfBirth,
    @JsonKey(name: 'also_known_as') List<String>? alsoKnownAs,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
