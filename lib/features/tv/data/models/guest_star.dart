// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_star.freezed.dart';
part 'guest_star.g.dart';

@freezed
class GuestStar with _$GuestStar {
  const factory GuestStar({
    required String character,
    @JsonKey(name: 'credit_id') required String creditId,
    required int order,
    required bool adult,
    int? gender,
    required int id,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'original_name') required String originalName,
    required double popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _GuestStar;

  factory GuestStar.fromJson(Map<String, dynamic> json) =>
      _$GuestStarFromJson(json);
}
