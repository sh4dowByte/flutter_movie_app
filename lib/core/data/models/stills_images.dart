// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stills_images.freezed.dart';
part 'stills_images.g.dart';

@freezed
class StillsImage with _$StillsImage {
  const factory StillsImage({
    @JsonKey(name: 'aspect_ratio') double? aspectRatio,
    int? height,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    @JsonKey(name: 'file_path') String? filePath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    int? width,
  }) = _StillsImage;

  factory StillsImage.fromJson(Map<String, dynamic> json) =>
      _$StillsImageFromJson(json);
}
