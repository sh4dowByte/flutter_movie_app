// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return _Actor.fromJson(json);
}

/// @nodoc
mixin _$Actor {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String? get knownForDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get deathday => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdb_id')
  String? get imdbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActorCopyWith<Actor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorCopyWith<$Res> {
  factory $ActorCopyWith(Actor value, $Res Function(Actor) then) =
      _$ActorCopyWithImpl<$Res, Actor>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'original_name') String? originalName,
      @JsonKey(name: 'media_type') String? mediaType,
      bool adult,
      double popularity,
      int gender,
      @JsonKey(name: 'known_for_department') String? knownForDepartment,
      @JsonKey(name: 'profile_path') String? profilePath,
      String? biography,
      String? birthday,
      String? deathday,
      String? homepage,
      @JsonKey(name: 'imdb_id') String? imdbId,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'also_known_as') List<String>? alsoKnownAs});
}

/// @nodoc
class _$ActorCopyWithImpl<$Res, $Val extends Actor>
    implements $ActorCopyWith<$Res> {
  _$ActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? originalName = freezed,
    Object? mediaType = freezed,
    Object? adult = null,
    Object? popularity = null,
    Object? gender = null,
    Object? knownForDepartment = freezed,
    Object? profilePath = freezed,
    Object? biography = freezed,
    Object? birthday = freezed,
    Object? deathday = freezed,
    Object? homepage = freezed,
    Object? imdbId = freezed,
    Object? placeOfBirth = freezed,
    Object? alsoKnownAs = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: freezed == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      deathday: freezed == deathday
          ? _value.deathday
          : deathday // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      alsoKnownAs: freezed == alsoKnownAs
          ? _value.alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorImplCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$$ActorImplCopyWith(
          _$ActorImpl value, $Res Function(_$ActorImpl) then) =
      __$$ActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'original_name') String? originalName,
      @JsonKey(name: 'media_type') String? mediaType,
      bool adult,
      double popularity,
      int gender,
      @JsonKey(name: 'known_for_department') String? knownForDepartment,
      @JsonKey(name: 'profile_path') String? profilePath,
      String? biography,
      String? birthday,
      String? deathday,
      String? homepage,
      @JsonKey(name: 'imdb_id') String? imdbId,
      @JsonKey(name: 'place_of_birth') String? placeOfBirth,
      @JsonKey(name: 'also_known_as') List<String>? alsoKnownAs});
}

/// @nodoc
class __$$ActorImplCopyWithImpl<$Res>
    extends _$ActorCopyWithImpl<$Res, _$ActorImpl>
    implements _$$ActorImplCopyWith<$Res> {
  __$$ActorImplCopyWithImpl(
      _$ActorImpl _value, $Res Function(_$ActorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? originalName = freezed,
    Object? mediaType = freezed,
    Object? adult = null,
    Object? popularity = null,
    Object? gender = null,
    Object? knownForDepartment = freezed,
    Object? profilePath = freezed,
    Object? biography = freezed,
    Object? birthday = freezed,
    Object? deathday = freezed,
    Object? homepage = freezed,
    Object? imdbId = freezed,
    Object? placeOfBirth = freezed,
    Object? alsoKnownAs = freezed,
  }) {
    return _then(_$ActorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: freezed == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      deathday: freezed == deathday
          ? _value.deathday
          : deathday // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      alsoKnownAs: freezed == alsoKnownAs
          ? _value._alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorImpl implements _Actor {
  const _$ActorImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'original_name') this.originalName,
      @JsonKey(name: 'media_type') this.mediaType,
      required this.adult,
      required this.popularity,
      required this.gender,
      @JsonKey(name: 'known_for_department') this.knownForDepartment,
      @JsonKey(name: 'profile_path') this.profilePath,
      this.biography,
      this.birthday,
      this.deathday,
      this.homepage,
      @JsonKey(name: 'imdb_id') this.imdbId,
      @JsonKey(name: 'place_of_birth') this.placeOfBirth,
      @JsonKey(name: 'also_known_as') final List<String>? alsoKnownAs})
      : _alsoKnownAs = alsoKnownAs;

  factory _$ActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  final bool adult;
  @override
  final double popularity;
  @override
  final int gender;
  @override
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  final String? biography;
  @override
  final String? birthday;
  @override
  final String? deathday;
  @override
  final String? homepage;
  @override
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @override
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  final List<String>? _alsoKnownAs;
  @override
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs {
    final value = _alsoKnownAs;
    if (value == null) return null;
    if (_alsoKnownAs is EqualUnmodifiableListView) return _alsoKnownAs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Actor(id: $id, name: $name, originalName: $originalName, mediaType: $mediaType, adult: $adult, popularity: $popularity, gender: $gender, knownForDepartment: $knownForDepartment, profilePath: $profilePath, biography: $biography, birthday: $birthday, deathday: $deathday, homepage: $homepage, imdbId: $imdbId, placeOfBirth: $placeOfBirth, alsoKnownAs: $alsoKnownAs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.deathday, deathday) ||
                other.deathday == deathday) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            const DeepCollectionEquality()
                .equals(other._alsoKnownAs, _alsoKnownAs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      originalName,
      mediaType,
      adult,
      popularity,
      gender,
      knownForDepartment,
      profilePath,
      biography,
      birthday,
      deathday,
      homepage,
      imdbId,
      placeOfBirth,
      const DeepCollectionEquality().hash(_alsoKnownAs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      __$$ActorImplCopyWithImpl<_$ActorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorImplToJson(
      this,
    );
  }
}

abstract class _Actor implements Actor {
  const factory _Actor(
      {required final int id,
      required final String name,
      @JsonKey(name: 'original_name') final String? originalName,
      @JsonKey(name: 'media_type') final String? mediaType,
      required final bool adult,
      required final double popularity,
      required final int gender,
      @JsonKey(name: 'known_for_department') final String? knownForDepartment,
      @JsonKey(name: 'profile_path') final String? profilePath,
      final String? biography,
      final String? birthday,
      final String? deathday,
      final String? homepage,
      @JsonKey(name: 'imdb_id') final String? imdbId,
      @JsonKey(name: 'place_of_birth') final String? placeOfBirth,
      @JsonKey(name: 'also_known_as')
      final List<String>? alsoKnownAs}) = _$ActorImpl;

  factory _Actor.fromJson(Map<String, dynamic> json) = _$ActorImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  bool get adult;
  @override
  double get popularity;
  @override
  int get gender;
  @override
  @JsonKey(name: 'known_for_department')
  String? get knownForDepartment;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  String? get biography;
  @override
  String? get birthday;
  @override
  String? get deathday;
  @override
  String? get homepage;
  @override
  @JsonKey(name: 'imdb_id')
  String? get imdbId;
  @override
  @JsonKey(name: 'place_of_birth')
  String? get placeOfBirth;
  @override
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs;
  @override
  @JsonKey(ignore: true)
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
