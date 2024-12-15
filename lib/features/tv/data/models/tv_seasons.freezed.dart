// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_seasons.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvSeason _$TvSeasonFromJson(Map<String, dynamic> json) {
  return _TvSeason.fromJson(json);
}

/// @nodoc
mixin _$TvSeason {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_date')
  String? get airDate => throw _privateConstructorUsedError;
  List<TvEpisode> get episodes => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_number')
  int get seasonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvSeasonCopyWith<TvSeason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSeasonCopyWith<$Res> {
  factory $TvSeasonCopyWith(TvSeason value, $Res Function(TvSeason) then) =
      _$TvSeasonCopyWithImpl<$Res, TvSeason>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'air_date') String? airDate,
      List<TvEpisode> episodes,
      String name,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class _$TvSeasonCopyWithImpl<$Res, $Val extends TvSeason>
    implements $TvSeasonCopyWith<$Res> {
  _$TvSeasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airDate = freezed,
    Object? episodes = null,
    Object? name = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<TvEpisode>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSeasonImplCopyWith<$Res>
    implements $TvSeasonCopyWith<$Res> {
  factory _$$TvSeasonImplCopyWith(
          _$TvSeasonImpl value, $Res Function(_$TvSeasonImpl) then) =
      __$$TvSeasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'air_date') String? airDate,
      List<TvEpisode> episodes,
      String name,
      String overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class __$$TvSeasonImplCopyWithImpl<$Res>
    extends _$TvSeasonCopyWithImpl<$Res, _$TvSeasonImpl>
    implements _$$TvSeasonImplCopyWith<$Res> {
  __$$TvSeasonImplCopyWithImpl(
      _$TvSeasonImpl _value, $Res Function(_$TvSeasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? airDate = freezed,
    Object? episodes = null,
    Object? name = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_$TvSeasonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<TvEpisode>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvSeasonImpl implements _TvSeason {
  const _$TvSeasonImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'air_date') this.airDate,
      required final List<TvEpisode> episodes,
      required this.name,
      required this.overview,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'season_number') required this.seasonNumber,
      @JsonKey(name: 'vote_average') this.voteAverage})
      : _episodes = episodes;

  factory _$TvSeasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvSeasonImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
  final List<TvEpisode> _episodes;
  @override
  List<TvEpisode> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  final String name;
  @override
  final String overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @override
  String toString() {
    return 'TvSeason(id: $id, airDate: $airDate, episodes: $episodes, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSeasonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      airDate,
      const DeepCollectionEquality().hash(_episodes),
      name,
      overview,
      posterPath,
      seasonNumber,
      voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSeasonImplCopyWith<_$TvSeasonImpl> get copyWith =>
      __$$TvSeasonImplCopyWithImpl<_$TvSeasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvSeasonImplToJson(
      this,
    );
  }
}

abstract class _TvSeason implements TvSeason {
  const factory _TvSeason(
          {@JsonKey(name: '_id') required final String id,
          @JsonKey(name: 'air_date') final String? airDate,
          required final List<TvEpisode> episodes,
          required final String name,
          required final String overview,
          @JsonKey(name: 'poster_path') final String? posterPath,
          @JsonKey(name: 'season_number') required final int seasonNumber,
          @JsonKey(name: 'vote_average') final double? voteAverage}) =
      _$TvSeasonImpl;

  factory _TvSeason.fromJson(Map<String, dynamic> json) =
      _$TvSeasonImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'air_date')
  String? get airDate;
  @override
  List<TvEpisode> get episodes;
  @override
  String get name;
  @override
  String get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'season_number')
  int get seasonNumber;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$$TvSeasonImplCopyWith<_$TvSeasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
