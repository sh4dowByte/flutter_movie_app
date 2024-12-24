// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvDetail _$TvDetailFromJson(Map<String, dynamic> json) {
  return _TvDetail.fromJson(json);
}

/// @nodoc
mixin _$TvDetail {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  List<dynamic>? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate => throw _privateConstructorUsedError;
  List<Genre>? get genres => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_production')
  bool get inProduction => throw _privateConstructorUsedError;
  List<String>? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_air_date')
  String? get lastAirDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_episode_to_air')
  TvEpisode? get lastEpisodeToAir => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_episode_to_air')
  TvEpisode? get nextEpisodeToAir => throw _privateConstructorUsedError;
  List<Network>? get networks => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_episodes')
  int get numberOfEpisodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_seasons')
  int get numberOfSeasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries =>
      throw _privateConstructorUsedError;
  List<Season>? get seasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages =>
      throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvDetailCopyWith<TvDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvDetailCopyWith<$Res> {
  factory $TvDetailCopyWith(TvDetail value, $Res Function(TvDetail) then) =
      _$TvDetailCopyWithImpl<$Res, TvDetail>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'created_by') List<dynamic>? createdBy,
      @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      List<Genre>? genres,
      String? homepage,
      int id,
      @JsonKey(name: 'in_production') bool inProduction,
      List<String>? languages,
      @JsonKey(name: 'last_air_date') String? lastAirDate,
      @JsonKey(name: 'last_episode_to_air') TvEpisode? lastEpisodeToAir,
      String name,
      @JsonKey(name: 'next_episode_to_air') TvEpisode? nextEpisodeToAir,
      List<Network>? networks,
      @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
      @JsonKey(name: 'origin_country') List<String>? originCountry,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_name') String originalName,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'production_companies')
      List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      List<ProductionCountry>? productionCountries,
      List<Season>? seasons,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
      String status,
      String? tagline,
      String type,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});

  $TvEpisodeCopyWith<$Res>? get lastEpisodeToAir;
  $TvEpisodeCopyWith<$Res>? get nextEpisodeToAir;
}

/// @nodoc
class _$TvDetailCopyWithImpl<$Res, $Val extends TvDetail>
    implements $TvDetailCopyWith<$Res> {
  _$TvDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? createdBy = freezed,
    Object? episodeRunTime = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? homepage = freezed,
    Object? id = null,
    Object? inProduction = null,
    Object? languages = freezed,
    Object? lastAirDate = freezed,
    Object? lastEpisodeToAir = freezed,
    Object? name = null,
    Object? nextEpisodeToAir = freezed,
    Object? networks = freezed,
    Object? numberOfEpisodes = null,
    Object? numberOfSeasons = null,
    Object? originCountry = freezed,
    Object? originalLanguage = null,
    Object? originalName = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? productionCompanies = freezed,
    Object? productionCountries = freezed,
    Object? seasons = freezed,
    Object? spokenLanguages = freezed,
    Object? status = null,
    Object? tagline = freezed,
    Object? type = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      episodeRunTime: freezed == episodeRunTime
          ? _value.episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inProduction: null == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastEpisodeToAir: freezed == lastEpisodeToAir
          ? _value.lastEpisodeToAir
          : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TvEpisode?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nextEpisodeToAir: freezed == nextEpisodeToAir
          ? _value.nextEpisodeToAir
          : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TvEpisode?,
      networks: freezed == networks
          ? _value.networks
          : networks // ignore: cast_nullable_to_non_nullable
              as List<Network>?,
      numberOfEpisodes: null == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSeasons: null == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: freezed == productionCompanies
          ? _value.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      productionCountries: freezed == productionCountries
          ? _value.productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>?,
      seasons: freezed == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
      spokenLanguages: freezed == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TvEpisodeCopyWith<$Res>? get lastEpisodeToAir {
    if (_value.lastEpisodeToAir == null) {
      return null;
    }

    return $TvEpisodeCopyWith<$Res>(_value.lastEpisodeToAir!, (value) {
      return _then(_value.copyWith(lastEpisodeToAir: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TvEpisodeCopyWith<$Res>? get nextEpisodeToAir {
    if (_value.nextEpisodeToAir == null) {
      return null;
    }

    return $TvEpisodeCopyWith<$Res>(_value.nextEpisodeToAir!, (value) {
      return _then(_value.copyWith(nextEpisodeToAir: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TvDetailImplCopyWith<$Res>
    implements $TvDetailCopyWith<$Res> {
  factory _$$TvDetailImplCopyWith(
          _$TvDetailImpl value, $Res Function(_$TvDetailImpl) then) =
      __$$TvDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'created_by') List<dynamic>? createdBy,
      @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      List<Genre>? genres,
      String? homepage,
      int id,
      @JsonKey(name: 'in_production') bool inProduction,
      List<String>? languages,
      @JsonKey(name: 'last_air_date') String? lastAirDate,
      @JsonKey(name: 'last_episode_to_air') TvEpisode? lastEpisodeToAir,
      String name,
      @JsonKey(name: 'next_episode_to_air') TvEpisode? nextEpisodeToAir,
      List<Network>? networks,
      @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
      @JsonKey(name: 'origin_country') List<String>? originCountry,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_name') String originalName,
      String overview,
      double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'production_companies')
      List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      List<ProductionCountry>? productionCountries,
      List<Season>? seasons,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
      String status,
      String? tagline,
      String type,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});

  @override
  $TvEpisodeCopyWith<$Res>? get lastEpisodeToAir;
  @override
  $TvEpisodeCopyWith<$Res>? get nextEpisodeToAir;
}

/// @nodoc
class __$$TvDetailImplCopyWithImpl<$Res>
    extends _$TvDetailCopyWithImpl<$Res, _$TvDetailImpl>
    implements _$$TvDetailImplCopyWith<$Res> {
  __$$TvDetailImplCopyWithImpl(
      _$TvDetailImpl _value, $Res Function(_$TvDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? createdBy = freezed,
    Object? episodeRunTime = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? homepage = freezed,
    Object? id = null,
    Object? inProduction = null,
    Object? languages = freezed,
    Object? lastAirDate = freezed,
    Object? lastEpisodeToAir = freezed,
    Object? name = null,
    Object? nextEpisodeToAir = freezed,
    Object? networks = freezed,
    Object? numberOfEpisodes = null,
    Object? numberOfSeasons = null,
    Object? originCountry = freezed,
    Object? originalLanguage = null,
    Object? originalName = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? productionCompanies = freezed,
    Object? productionCountries = freezed,
    Object? seasons = freezed,
    Object? spokenLanguages = freezed,
    Object? status = null,
    Object? tagline = freezed,
    Object? type = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_$TvDetailImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value._createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      episodeRunTime: freezed == episodeRunTime
          ? _value._episodeRunTime
          : episodeRunTime // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inProduction: null == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastEpisodeToAir: freezed == lastEpisodeToAir
          ? _value.lastEpisodeToAir
          : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TvEpisode?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nextEpisodeToAir: freezed == nextEpisodeToAir
          ? _value.nextEpisodeToAir
          : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TvEpisode?,
      networks: freezed == networks
          ? _value._networks
          : networks // ignore: cast_nullable_to_non_nullable
              as List<Network>?,
      numberOfEpisodes: null == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSeasons: null == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int,
      originCountry: freezed == originCountry
          ? _value._originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      productionCompanies: freezed == productionCompanies
          ? _value._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      productionCountries: freezed == productionCountries
          ? _value._productionCountries
          : productionCountries // ignore: cast_nullable_to_non_nullable
              as List<ProductionCountry>?,
      seasons: freezed == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
      spokenLanguages: freezed == spokenLanguages
          ? _value._spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<SpokenLanguage>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvDetailImpl implements _TvDetail {
  const _$TvDetailImpl(
      {required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'created_by') final List<dynamic>? createdBy,
      @JsonKey(name: 'episode_run_time') final List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      final List<Genre>? genres,
      this.homepage,
      required this.id,
      @JsonKey(name: 'in_production') required this.inProduction,
      final List<String>? languages,
      @JsonKey(name: 'last_air_date') this.lastAirDate,
      @JsonKey(name: 'last_episode_to_air') this.lastEpisodeToAir,
      required this.name,
      @JsonKey(name: 'next_episode_to_air') this.nextEpisodeToAir,
      final List<Network>? networks,
      @JsonKey(name: 'number_of_episodes') required this.numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') required this.numberOfSeasons,
      @JsonKey(name: 'origin_country') final List<String>? originCountry,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_name') required this.originalName,
      required this.overview,
      required this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'production_companies')
      final List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      final List<ProductionCountry>? productionCountries,
      final List<Season>? seasons,
      @JsonKey(name: 'spoken_languages')
      final List<SpokenLanguage>? spokenLanguages,
      required this.status,
      this.tagline,
      required this.type,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount})
      : _createdBy = createdBy,
        _episodeRunTime = episodeRunTime,
        _genres = genres,
        _languages = languages,
        _networks = networks,
        _originCountry = originCountry,
        _productionCompanies = productionCompanies,
        _productionCountries = productionCountries,
        _seasons = seasons,
        _spokenLanguages = spokenLanguages;

  factory _$TvDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvDetailImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<dynamic>? _createdBy;
  @override
  @JsonKey(name: 'created_by')
  List<dynamic>? get createdBy {
    final value = _createdBy;
    if (value == null) return null;
    if (_createdBy is EqualUnmodifiableListView) return _createdBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _episodeRunTime;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime {
    final value = _episodeRunTime;
    if (value == null) return null;
    if (_episodeRunTime is EqualUnmodifiableListView) return _episodeRunTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  final List<Genre>? _genres;
  @override
  List<Genre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? homepage;
  @override
  final int id;
  @override
  @JsonKey(name: 'in_production')
  final bool inProduction;
  final List<String>? _languages;
  @override
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'last_air_date')
  final String? lastAirDate;
  @override
  @JsonKey(name: 'last_episode_to_air')
  final TvEpisode? lastEpisodeToAir;
  @override
  final String name;
  @override
  @JsonKey(name: 'next_episode_to_air')
  final TvEpisode? nextEpisodeToAir;
  final List<Network>? _networks;
  @override
  List<Network>? get networks {
    final value = _networks;
    if (value == null) return null;
    if (_networks is EqualUnmodifiableListView) return _networks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'number_of_episodes')
  final int numberOfEpisodes;
  @override
  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;
  final List<String>? _originCountry;
  @override
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry {
    final value = _originCountry;
    if (value == null) return null;
    if (_originCountry is EqualUnmodifiableListView) return _originCountry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<ProductionCompany>? _productionCompanies;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies {
    final value = _productionCompanies;
    if (value == null) return null;
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductionCountry>? _productionCountries;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries {
    final value = _productionCountries;
    if (value == null) return null;
    if (_productionCountries is EqualUnmodifiableListView)
      return _productionCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Season>? _seasons;
  @override
  List<Season>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpokenLanguage>? _spokenLanguages;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages {
    final value = _spokenLanguages;
    if (value == null) return null;
    if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String status;
  @override
  final String? tagline;
  @override
  final String type;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  String toString() {
    return 'TvDetail(adult: $adult, backdropPath: $backdropPath, createdBy: $createdBy, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, seasons: $seasons, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, type: $type, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvDetailImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality()
                .equals(other._createdBy, _createdBy) &&
            const DeepCollectionEquality()
                .equals(other._episodeRunTime, _episodeRunTime) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inProduction, inProduction) ||
                other.inProduction == inProduction) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.lastAirDate, lastAirDate) ||
                other.lastAirDate == lastAirDate) &&
            (identical(other.lastEpisodeToAir, lastEpisodeToAir) ||
                other.lastEpisodeToAir == lastEpisodeToAir) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nextEpisodeToAir, nextEpisodeToAir) ||
                other.nextEpisodeToAir == nextEpisodeToAir) &&
            const DeepCollectionEquality().equals(other._networks, _networks) &&
            (identical(other.numberOfEpisodes, numberOfEpisodes) ||
                other.numberOfEpisodes == numberOfEpisodes) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            const DeepCollectionEquality()
                .equals(other._originCountry, _originCountry) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            const DeepCollectionEquality()
                .equals(other._productionCompanies, _productionCompanies) &&
            const DeepCollectionEquality()
                .equals(other._productionCountries, _productionCountries) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            const DeepCollectionEquality()
                .equals(other._spokenLanguages, _spokenLanguages) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        adult,
        backdropPath,
        const DeepCollectionEquality().hash(_createdBy),
        const DeepCollectionEquality().hash(_episodeRunTime),
        firstAirDate,
        const DeepCollectionEquality().hash(_genres),
        homepage,
        id,
        inProduction,
        const DeepCollectionEquality().hash(_languages),
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        const DeepCollectionEquality().hash(_networks),
        numberOfEpisodes,
        numberOfSeasons,
        const DeepCollectionEquality().hash(_originCountry),
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        const DeepCollectionEquality().hash(_productionCompanies),
        const DeepCollectionEquality().hash(_productionCountries),
        const DeepCollectionEquality().hash(_seasons),
        const DeepCollectionEquality().hash(_spokenLanguages),
        status,
        tagline,
        type,
        voteAverage,
        voteCount
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvDetailImplCopyWith<_$TvDetailImpl> get copyWith =>
      __$$TvDetailImplCopyWithImpl<_$TvDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvDetailImplToJson(
      this,
    );
  }
}

abstract class _TvDetail implements TvDetail {
  const factory _TvDetail(
      {required final bool adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'created_by') final List<dynamic>? createdBy,
      @JsonKey(name: 'episode_run_time') final List<int>? episodeRunTime,
      @JsonKey(name: 'first_air_date') final String? firstAirDate,
      final List<Genre>? genres,
      final String? homepage,
      required final int id,
      @JsonKey(name: 'in_production') required final bool inProduction,
      final List<String>? languages,
      @JsonKey(name: 'last_air_date') final String? lastAirDate,
      @JsonKey(name: 'last_episode_to_air') final TvEpisode? lastEpisodeToAir,
      required final String name,
      @JsonKey(name: 'next_episode_to_air') final TvEpisode? nextEpisodeToAir,
      final List<Network>? networks,
      @JsonKey(name: 'number_of_episodes') required final int numberOfEpisodes,
      @JsonKey(name: 'number_of_seasons') required final int numberOfSeasons,
      @JsonKey(name: 'origin_country') final List<String>? originCountry,
      @JsonKey(name: 'original_language')
      required final String originalLanguage,
      @JsonKey(name: 'original_name') required final String originalName,
      required final String overview,
      required final double popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'production_companies')
      final List<ProductionCompany>? productionCompanies,
      @JsonKey(name: 'production_countries')
      final List<ProductionCountry>? productionCountries,
      final List<Season>? seasons,
      @JsonKey(name: 'spoken_languages')
      final List<SpokenLanguage>? spokenLanguages,
      required final String status,
      final String? tagline,
      required final String type,
      @JsonKey(name: 'vote_average') required final double voteAverage,
      @JsonKey(name: 'vote_count')
      required final int voteCount}) = _$TvDetailImpl;

  factory _TvDetail.fromJson(Map<String, dynamic> json) =
      _$TvDetailImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'created_by')
  List<dynamic>? get createdBy;
  @override
  @JsonKey(name: 'episode_run_time')
  List<int>? get episodeRunTime;
  @override
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @override
  List<Genre>? get genres;
  @override
  String? get homepage;
  @override
  int get id;
  @override
  @JsonKey(name: 'in_production')
  bool get inProduction;
  @override
  List<String>? get languages;
  @override
  @JsonKey(name: 'last_air_date')
  String? get lastAirDate;
  @override
  @JsonKey(name: 'last_episode_to_air')
  TvEpisode? get lastEpisodeToAir;
  @override
  String get name;
  @override
  @JsonKey(name: 'next_episode_to_air')
  TvEpisode? get nextEpisodeToAir;
  @override
  List<Network>? get networks;
  @override
  @JsonKey(name: 'number_of_episodes')
  int get numberOfEpisodes;
  @override
  @JsonKey(name: 'number_of_seasons')
  int get numberOfSeasons;
  @override
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? get productionCompanies;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? get productionCountries;
  @override
  List<Season>? get seasons;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? get spokenLanguages;
  @override
  String get status;
  @override
  String? get tagline;
  @override
  String get type;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$TvDetailImplCopyWith<_$TvDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
mixin _$Genre {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res, Genre>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res, $Val extends Genre>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreImplCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$$GenreImplCopyWith(
          _$GenreImpl value, $Res Function(_$GenreImpl) then) =
      __$$GenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$GenreImplCopyWithImpl<$Res>
    extends _$GenreCopyWithImpl<$Res, _$GenreImpl>
    implements _$$GenreImplCopyWith<$Res> {
  __$$GenreImplCopyWithImpl(
      _$GenreImpl _value, $Res Function(_$GenreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$GenreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreImpl implements _Genre {
  const _$GenreImpl({required this.id, required this.name});

  factory _$GenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      __$$GenreImplCopyWithImpl<_$GenreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreImplToJson(
      this,
    );
  }
}

abstract class _Genre implements Genre {
  const factory _Genre({required final int id, required final String name}) =
      _$GenreImpl;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$GenreImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return _Network.fromJson(json);
}

/// @nodoc
mixin _$Network {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_path')
  String? get logoPath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  String? get originCountry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkCopyWith<Network> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkCopyWith<$Res> {
  factory $NetworkCopyWith(Network value, $Res Function(Network) then) =
      _$NetworkCopyWithImpl<$Res, Network>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      String name,
      @JsonKey(name: 'origin_country') String? originCountry});
}

/// @nodoc
class _$NetworkCopyWithImpl<$Res, $Val extends Network>
    implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = null,
    Object? originCountry = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res> implements $NetworkCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      String name,
      @JsonKey(name: 'origin_country') String? originCountry});
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$NetworkCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = null,
    Object? originCountry = freezed,
  }) {
    return _then(_$NetworkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkImpl implements _Network {
  const _$NetworkImpl(
      {required this.id,
      @JsonKey(name: 'logo_path') this.logoPath,
      required this.name,
      @JsonKey(name: 'origin_country') this.originCountry});

  factory _$NetworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @override
  final String name;
  @override
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  @override
  String toString() {
    return 'Network(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, logoPath, name, originCountry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      __$$NetworkImplCopyWithImpl<_$NetworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkImplToJson(
      this,
    );
  }
}

abstract class _Network implements Network {
  const factory _Network(
          {required final int id,
          @JsonKey(name: 'logo_path') final String? logoPath,
          required final String name,
          @JsonKey(name: 'origin_country') final String? originCountry}) =
      _$NetworkImpl;

  factory _Network.fromJson(Map<String, dynamic> json) = _$NetworkImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'logo_path')
  String? get logoPath;
  @override
  String get name;
  @override
  @JsonKey(name: 'origin_country')
  String? get originCountry;
  @override
  @JsonKey(ignore: true)
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return _ProductionCompany.fromJson(json);
}

/// @nodoc
mixin _$ProductionCompany {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_path')
  String? get logoPath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  String get originCountry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCompanyCopyWith<ProductionCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCompanyCopyWith<$Res> {
  factory $ProductionCompanyCopyWith(
          ProductionCompany value, $Res Function(ProductionCompany) then) =
      _$ProductionCompanyCopyWithImpl<$Res, ProductionCompany>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      String name,
      @JsonKey(name: 'origin_country') String originCountry});
}

/// @nodoc
class _$ProductionCompanyCopyWithImpl<$Res, $Val extends ProductionCompany>
    implements $ProductionCompanyCopyWith<$Res> {
  _$ProductionCompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = null,
    Object? originCountry = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionCompanyImplCopyWith<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  factory _$$ProductionCompanyImplCopyWith(_$ProductionCompanyImpl value,
          $Res Function(_$ProductionCompanyImpl) then) =
      __$$ProductionCompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'logo_path') String? logoPath,
      String name,
      @JsonKey(name: 'origin_country') String originCountry});
}

/// @nodoc
class __$$ProductionCompanyImplCopyWithImpl<$Res>
    extends _$ProductionCompanyCopyWithImpl<$Res, _$ProductionCompanyImpl>
    implements _$$ProductionCompanyImplCopyWith<$Res> {
  __$$ProductionCompanyImplCopyWithImpl(_$ProductionCompanyImpl _value,
      $Res Function(_$ProductionCompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logoPath = freezed,
    Object? name = null,
    Object? originCountry = null,
  }) {
    return _then(_$ProductionCompanyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionCompanyImpl implements _ProductionCompany {
  const _$ProductionCompanyImpl(
      {required this.id,
      @JsonKey(name: 'logo_path') this.logoPath,
      required this.name,
      @JsonKey(name: 'origin_country') required this.originCountry});

  factory _$ProductionCompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionCompanyImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @override
  final String name;
  @override
  @JsonKey(name: 'origin_country')
  final String originCountry;

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionCompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, logoPath, name, originCountry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionCompanyImplCopyWith<_$ProductionCompanyImpl> get copyWith =>
      __$$ProductionCompanyImplCopyWithImpl<_$ProductionCompanyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionCompanyImplToJson(
      this,
    );
  }
}

abstract class _ProductionCompany implements ProductionCompany {
  const factory _ProductionCompany(
      {required final int id,
      @JsonKey(name: 'logo_path') final String? logoPath,
      required final String name,
      @JsonKey(name: 'origin_country')
      required final String originCountry}) = _$ProductionCompanyImpl;

  factory _ProductionCompany.fromJson(Map<String, dynamic> json) =
      _$ProductionCompanyImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'logo_path')
  String? get logoPath;
  @override
  String get name;
  @override
  @JsonKey(name: 'origin_country')
  String get originCountry;
  @override
  @JsonKey(ignore: true)
  _$$ProductionCompanyImplCopyWith<_$ProductionCompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return _ProductionCountry.fromJson(json);
}

/// @nodoc
mixin _$ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  String get iso31661 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCountryCopyWith<ProductionCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCountryCopyWith<$Res> {
  factory $ProductionCountryCopyWith(
          ProductionCountry value, $Res Function(ProductionCountry) then) =
      _$ProductionCountryCopyWithImpl<$Res, ProductionCountry>;
  @useResult
  $Res call({@JsonKey(name: 'iso_3166_1') String iso31661, String name});
}

/// @nodoc
class _$ProductionCountryCopyWithImpl<$Res, $Val extends ProductionCountry>
    implements $ProductionCountryCopyWith<$Res> {
  _$ProductionCountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso31661 = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionCountryImplCopyWith<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  factory _$$ProductionCountryImplCopyWith(_$ProductionCountryImpl value,
          $Res Function(_$ProductionCountryImpl) then) =
      __$$ProductionCountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'iso_3166_1') String iso31661, String name});
}

/// @nodoc
class __$$ProductionCountryImplCopyWithImpl<$Res>
    extends _$ProductionCountryCopyWithImpl<$Res, _$ProductionCountryImpl>
    implements _$$ProductionCountryImplCopyWith<$Res> {
  __$$ProductionCountryImplCopyWithImpl(_$ProductionCountryImpl _value,
      $Res Function(_$ProductionCountryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso31661 = null,
    Object? name = null,
  }) {
    return _then(_$ProductionCountryImpl(
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionCountryImpl implements _ProductionCountry {
  const _$ProductionCountryImpl(
      {@JsonKey(name: 'iso_3166_1') required this.iso31661,
      required this.name});

  factory _$ProductionCountryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionCountryImplFromJson(json);

  @override
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  @override
  final String name;

  @override
  String toString() {
    return 'ProductionCountry(iso31661: $iso31661, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionCountryImpl &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iso31661, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionCountryImplCopyWith<_$ProductionCountryImpl> get copyWith =>
      __$$ProductionCountryImplCopyWithImpl<_$ProductionCountryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionCountryImplToJson(
      this,
    );
  }
}

abstract class _ProductionCountry implements ProductionCountry {
  const factory _ProductionCountry(
      {@JsonKey(name: 'iso_3166_1') required final String iso31661,
      required final String name}) = _$ProductionCountryImpl;

  factory _ProductionCountry.fromJson(Map<String, dynamic> json) =
      _$ProductionCountryImpl.fromJson;

  @override
  @JsonKey(name: 'iso_3166_1')
  String get iso31661;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ProductionCountryImplCopyWith<_$ProductionCountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Season _$SeasonFromJson(Map<String, dynamic> json) {
  return _Season.fromJson(json);
}

/// @nodoc
mixin _$Season {
  @JsonKey(name: 'air_date')
  String? get airDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_count')
  int get episodeCount => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_number')
  int get seasonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonCopyWith<Season> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonCopyWith<$Res> {
  factory $SeasonCopyWith(Season value, $Res Function(Season) then) =
      _$SeasonCopyWithImpl<$Res, Season>;
  @useResult
  $Res call(
      {@JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_count') int episodeCount,
      int id,
      String name,
      String? overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class _$SeasonCopyWithImpl<$Res, $Val extends Season>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeCount = null,
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$SeasonImplCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$$SeasonImplCopyWith(
          _$SeasonImpl value, $Res Function(_$SeasonImpl) then) =
      __$$SeasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'air_date') String? airDate,
      @JsonKey(name: 'episode_count') int episodeCount,
      int id,
      String name,
      String? overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'season_number') int seasonNumber,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class __$$SeasonImplCopyWithImpl<$Res>
    extends _$SeasonCopyWithImpl<$Res, _$SeasonImpl>
    implements _$$SeasonImplCopyWith<$Res> {
  __$$SeasonImplCopyWithImpl(
      _$SeasonImpl _value, $Res Function(_$SeasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeCount = null,
    Object? id = null,
    Object? name = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_$SeasonImpl(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeCount: null == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$SeasonImpl implements _Season {
  const _$SeasonImpl(
      {@JsonKey(name: 'air_date') this.airDate,
      @JsonKey(name: 'episode_count') required this.episodeCount,
      required this.id,
      required this.name,
      this.overview,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'season_number') required this.seasonNumber,
      @JsonKey(name: 'vote_average') this.voteAverage});

  factory _$SeasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonImplFromJson(json);

  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
  @override
  @JsonKey(name: 'episode_count')
  final int episodeCount;
  @override
  final int id;
  @override
  final String name;
  @override
  final String? overview;
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
    return 'Season(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonImpl &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeCount, episodeCount) ||
                other.episodeCount == episodeCount) &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode => Object.hash(runtimeType, airDate, episodeCount, id, name,
      overview, posterPath, seasonNumber, voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonImplCopyWith<_$SeasonImpl> get copyWith =>
      __$$SeasonImplCopyWithImpl<_$SeasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonImplToJson(
      this,
    );
  }
}

abstract class _Season implements Season {
  const factory _Season(
      {@JsonKey(name: 'air_date') final String? airDate,
      @JsonKey(name: 'episode_count') required final int episodeCount,
      required final int id,
      required final String name,
      final String? overview,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'season_number') required final int seasonNumber,
      @JsonKey(name: 'vote_average') final double? voteAverage}) = _$SeasonImpl;

  factory _Season.fromJson(Map<String, dynamic> json) = _$SeasonImpl.fromJson;

  @override
  @JsonKey(name: 'air_date')
  String? get airDate;
  @override
  @JsonKey(name: 'episode_count')
  int get episodeCount;
  @override
  int get id;
  @override
  String get name;
  @override
  String? get overview;
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
  _$$SeasonImplCopyWith<_$SeasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _SpokenLanguage.fromJson(json);
}

/// @nodoc
mixin _$SpokenLanguage {
  @JsonKey(name: 'english_name')
  String? get englishName => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_639_1')
  String get iso6391 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpokenLanguageCopyWith<SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpokenLanguageCopyWith<$Res> {
  factory $SpokenLanguageCopyWith(
          SpokenLanguage value, $Res Function(SpokenLanguage) then) =
      _$SpokenLanguageCopyWithImpl<$Res, SpokenLanguage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'english_name') String? englishName,
      @JsonKey(name: 'iso_639_1') String iso6391,
      String name});
}

/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res, $Val extends SpokenLanguage>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? englishName = freezed,
    Object? iso6391 = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpokenLanguageImplCopyWith<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  factory _$$SpokenLanguageImplCopyWith(_$SpokenLanguageImpl value,
          $Res Function(_$SpokenLanguageImpl) then) =
      __$$SpokenLanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'english_name') String? englishName,
      @JsonKey(name: 'iso_639_1') String iso6391,
      String name});
}

/// @nodoc
class __$$SpokenLanguageImplCopyWithImpl<$Res>
    extends _$SpokenLanguageCopyWithImpl<$Res, _$SpokenLanguageImpl>
    implements _$$SpokenLanguageImplCopyWith<$Res> {
  __$$SpokenLanguageImplCopyWithImpl(
      _$SpokenLanguageImpl _value, $Res Function(_$SpokenLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? englishName = freezed,
    Object? iso6391 = null,
    Object? name = null,
  }) {
    return _then(_$SpokenLanguageImpl(
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpokenLanguageImpl implements _SpokenLanguage {
  const _$SpokenLanguageImpl(
      {@JsonKey(name: 'english_name') this.englishName,
      @JsonKey(name: 'iso_639_1') required this.iso6391,
      required this.name});

  factory _$SpokenLanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpokenLanguageImplFromJson(json);

  @override
  @JsonKey(name: 'english_name')
  final String? englishName;
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @override
  final String name;

  @override
  String toString() {
    return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpokenLanguageImpl &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, englishName, iso6391, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      __$$SpokenLanguageImplCopyWithImpl<_$SpokenLanguageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpokenLanguageImplToJson(
      this,
    );
  }
}

abstract class _SpokenLanguage implements SpokenLanguage {
  const factory _SpokenLanguage(
      {@JsonKey(name: 'english_name') final String? englishName,
      @JsonKey(name: 'iso_639_1') required final String iso6391,
      required final String name}) = _$SpokenLanguageImpl;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$SpokenLanguageImpl.fromJson;

  @override
  @JsonKey(name: 'english_name')
  String? get englishName;
  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SpokenLanguageImplCopyWith<_$SpokenLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
