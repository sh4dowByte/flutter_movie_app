// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_clip.freezed.dart';
part 'movie_clip.g.dart';

@freezed
class MovieClip with _$MovieClip {
  const factory MovieClip({
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'iso_3166_1') required String iso31661,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    required String id,
  }) = _MovieClip;

  factory MovieClip.fromJson(Map<String, dynamic> json) =>
      _$MovieClipFromJson(json);
}
