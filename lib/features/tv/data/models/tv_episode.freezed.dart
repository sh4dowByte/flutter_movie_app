// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvEpisode _$TvEpisodeFromJson(Map<String, dynamic> json) {
  return _TvEpisode.fromJson(json);
}

/// @nodoc
mixin _$TvEpisode {
  @JsonKey(name: 'air_date')
  String? get airDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_number')
  int get episodeNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_type')
  String? get episodeType => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_code')
  String? get productionCode => throw _privateConstructorUsedError;
  int? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_number')
  int get seasonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_id')
  int get showId => throw _privateConstructorUsedError;
  @JsonKey(name: 'still_path')
  String? get stillPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;
  List<Crew> get crew => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_stars')
  List<GuestStar> get guestStars => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvEpisodeCopyWith<TvEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvEpisodeCopyWith<$Res> {
  factory $TvEpisodeCopyWith(TvEpisode value, $Res Function(TvEpisode) then) =
      _$TvEpisodeCopyWithImpl<$Res, TvEpisode>;
  @useResult
  $Res call(
      {@JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_number') int episodeNumber,
      @JsonKey(name: 'episode_type') String? episodeType,
      int id,
      String name,
      String? overview,
      @JsonKey(name: 'production_code') String? productionCode,
      int? runtime,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'show_id') int showId,
      @JsonKey(name: 'still_path') String? stillPath,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      List<Crew> crew,
      @JsonKey(name: 'guest_stars') List<GuestStar> guestStars});
}

/// @nodoc
class _$TvEpisodeCopyWithImpl<$Res, $Val extends TvEpisode>
    implements $TvEpisodeCopyWith<$Res> {
  _$TvEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeNumber = null,
    Object? episodeType = freezed,
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? productionCode = freezed,
    Object? runtime = freezed,
    Object? seasonNumber = null,
    Object? showId = null,
    Object? stillPath = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? crew = null,
    Object? guestStars = null,
  }) {
    return _then(_value.copyWith(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      episodeType: freezed == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCode: freezed == productionCode
          ? _value.productionCode
          : productionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      showId: null == showId
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
      guestStars: null == guestStars
          ? _value.guestStars
          : guestStars // ignore: cast_nullable_to_non_nullable
              as List<GuestStar>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvEpisodeImplCopyWith<$Res>
    implements $TvEpisodeCopyWith<$Res> {
  factory _$$TvEpisodeImplCopyWith(
          _$TvEpisodeImpl value, $Res Function(_$TvEpisodeImpl) then) =
      __$$TvEpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_number') int episodeNumber,
      @JsonKey(name: 'episode_type') String? episodeType,
      int id,
      String name,
      String? overview,
      @JsonKey(name: 'production_code') String? productionCode,
      int? runtime,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'show_id') int showId,
      @JsonKey(name: 'still_path') String? stillPath,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount,
      List<Crew> crew,
      @JsonKey(name: 'guest_stars') List<GuestStar> guestStars});
}

/// @nodoc
class __$$TvEpisodeImplCopyWithImpl<$Res>
    extends _$TvEpisodeCopyWithImpl<$Res, _$TvEpisodeImpl>
    implements _$$TvEpisodeImplCopyWith<$Res> {
  __$$TvEpisodeImplCopyWithImpl(
      _$TvEpisodeImpl _value, $Res Function(_$TvEpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeNumber = null,
    Object? episodeType = freezed,
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? productionCode = freezed,
    Object? runtime = freezed,
    Object? seasonNumber = null,
    Object? showId = null,
    Object? stillPath = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? crew = null,
    Object? guestStars = null,
  }) {
    return _then(_$TvEpisodeImpl(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      episodeType: freezed == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCode: freezed == productionCode
          ? _value.productionCode
          : productionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      showId: null == showId
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
      guestStars: null == guestStars
          ? _value._guestStars
          : guestStars // ignore: cast_nullable_to_non_nullable
              as List<GuestStar>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvEpisodeImpl implements _TvEpisode {
  const _$TvEpisodeImpl(
      {@JsonKey(name: 'air_date') this.airDate,
      @JsonKey(name: 'episode_number') required this.episodeNumber,
      @JsonKey(name: 'episode_type') this.episodeType,
      required this.id,
      required this.name,
      this.overview,
      @JsonKey(name: 'production_code') this.productionCode,
      this.runtime,
      @JsonKey(name: 'season_number') required this.seasonNumber,
      @JsonKey(name: 'show_id') required this.showId,
      @JsonKey(name: 'still_path') this.stillPath,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount,
      required final List<Crew> crew,
      @JsonKey(name: 'guest_stars') required final List<GuestStar> guestStars})
      : _crew = crew,
        _guestStars = guestStars;

  factory _$TvEpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvEpisodeImplFromJson(json);

  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
  @override
  @JsonKey(name: 'episode_number')
  final int episodeNumber;
  @override
  @JsonKey(name: 'episode_type')
  final String? episodeType;
  @override
  final int id;
  @override
  final String name;
  @override
  final String? overview;
  @override
  @JsonKey(name: 'production_code')
  final String? productionCode;
  @override
  final int? runtime;
  @override
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @override
  @JsonKey(name: 'show_id')
  final int showId;
  @override
  @JsonKey(name: 'still_path')
  final String? stillPath;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  final List<Crew> _crew;
  @override
  List<Crew> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  final List<GuestStar> _guestStars;
  @override
  @JsonKey(name: 'guest_stars')
  List<GuestStar> get guestStars {
    if (_guestStars is EqualUnmodifiableListView) return _guestStars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestStars);
  }

  @override
  String toString() {
    return 'TvEpisode(airDate: $airDate, episodeNumber: $episodeNumber, episodeType: $episodeType, id: $id, name: $name, overview: $overview, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount, crew: $crew, guestStars: $guestStars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvEpisodeImpl &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.episodeType, episodeType) ||
                other.episodeType == episodeType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.productionCode, productionCode) ||
                other.productionCode == productionCode) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.showId, showId) || other.showId == showId) &&
            (identical(other.stillPath, stillPath) ||
                other.stillPath == stillPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            const DeepCollectionEquality().equals(other._crew, _crew) &&
            const DeepCollectionEquality()
                .equals(other._guestStars, _guestStars));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airDate,
      episodeNumber,
      episodeType,
      id,
      name,
      overview,
      productionCode,
      runtime,
      seasonNumber,
      showId,
      stillPath,
      voteAverage,
      voteCount,
      const DeepCollectionEquality().hash(_crew),
      const DeepCollectionEquality().hash(_guestStars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvEpisodeImplCopyWith<_$TvEpisodeImpl> get copyWith =>
      __$$TvEpisodeImplCopyWithImpl<_$TvEpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvEpisodeImplToJson(
      this,
    );
  }
}

abstract class _TvEpisode implements TvEpisode {
  const factory _TvEpisode(
      {@JsonKey(name: 'air_date') final String? airDate,
      @JsonKey(name: 'episode_number') required final int episodeNumber,
      @JsonKey(name: 'episode_type') final String? episodeType,
      required final int id,
      required final String name,
      final String? overview,
      @JsonKey(name: 'production_code') final String? productionCode,
      final int? runtime,
      @JsonKey(name: 'season_number') required final int seasonNumber,
      @JsonKey(name: 'show_id') required final int showId,
      @JsonKey(name: 'still_path') final String? stillPath,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount,
      required final List<Crew> crew,
      @JsonKey(name: 'guest_stars')
      required final List<GuestStar> guestStars}) = _$TvEpisodeImpl;

  factory _TvEpisode.fromJson(Map<String, dynamic> json) =
      _$TvEpisodeImpl.fromJson;

  @override
  @JsonKey(name: 'air_date')
  String? get airDate;
  @override
  @JsonKey(name: 'episode_number')
  int get episodeNumber;
  @override
  @JsonKey(name: 'episode_type')
  String? get episodeType;
  @override
  int get id;
  @override
  String get name;
  @override
  String? get overview;
  @override
  @JsonKey(name: 'production_code')
  String? get productionCode;
  @override
  int? get runtime;
  @override
  @JsonKey(name: 'season_number')
  int get seasonNumber;
  @override
  @JsonKey(name: 'show_id')
  int get showId;
  @override
  @JsonKey(name: 'still_path')
  String? get stillPath;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  List<Crew> get crew;
  @override
  @JsonKey(name: 'guest_stars')
  List<GuestStar> get guestStars;
  @override
  @JsonKey(ignore: true)
  _$$TvEpisodeImplCopyWith<_$TvEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
