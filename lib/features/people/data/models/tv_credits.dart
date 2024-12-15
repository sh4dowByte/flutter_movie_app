import 'package:flutter_movie_app/features/people/data/models/cast.dart';
import 'package:flutter_movie_app/features/people/data/models/crew.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_credits.freezed.dart';
part 'tv_credits.g.dart';

@freezed
class TvCredits with _$TvCredits {
  factory TvCredits({
    required List<Cast> cast,
    required List<Crew> crew,
  }) = _TvCredits;

  factory TvCredits.fromJson(Map<String, dynamic> json) =>
      _$TvCreditsFromJson(json);
}
