// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
class Actor with _$Actor {
  const factory Actor({
    required bool adult,
    @JsonKey(name: 'also_known_as') required List<String> alsoKnownAs,
    required String biography,
    required String birthday,
    String? deathday,
    required int gender,
    String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') required String imdbId,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'place_of_birth') required String placeOfBirth,
    required double popularity,
    @JsonKey(name: 'profile_path') required String profilePath,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}

extension MovieImageUrl on Actor {
  String _getImageUrl(String size, {bool isBackdrop = false}) {
    return profilePath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/$size$profilePath'
        : 'https://img.icons8.com/?size=480&id=gX6VczTLnV3E&format=png';
  }

  String get backdropUrlOriginal => _getImageUrl('original', isBackdrop: true);
  String get backdropUrlW500 => _getImageUrl('w500', isBackdrop: true);
  String get backdropUrlW300 => _getImageUrl('w300', isBackdrop: true);
  String get imageUrlOriginal => _getImageUrl('original');
  String get imageUrlW500 => _getImageUrl('w500');
  String get imageUrlW300 => _getImageUrl('w300');
  String get imageUrlW200 => _getImageUrl('w200');

  /// Calculate the age based on the birthday
  String get age {
    final birthDate = DateTime.parse(birthday);
    final currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return '$age years old';
  }

  // String get formatBirth {
  //   return DateFormat("d MMMM yyyy", "id_ID").format(DateTime.parse(birthday));
  // }

  String get formatBirth {
    if (birthday.isEmpty) {
      return 'Unknown birth date';
    }
    try {
      final parsedDate = DateTime.parse(birthday);
      // Return only the year
      return DateFormat("d MMMM yyyy").format(parsedDate).toString();
    } catch (e) {
      return 'Invalid date format';
    }
  }
}
