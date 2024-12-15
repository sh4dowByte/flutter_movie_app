// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_credits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvCredits _$TvCreditsFromJson(Map<String, dynamic> json) {
  return _TvCredits.fromJson(json);
}

/// @nodoc
mixin _$TvCredits {
  List<Cast> get cast => throw _privateConstructorUsedError;
  List<Crew> get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvCreditsCopyWith<TvCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvCreditsCopyWith<$Res> {
  factory $TvCreditsCopyWith(TvCredits value, $Res Function(TvCredits) then) =
      _$TvCreditsCopyWithImpl<$Res, TvCredits>;
  @useResult
  $Res call({List<Cast> cast, List<Crew> crew});
}

/// @nodoc
class _$TvCreditsCopyWithImpl<$Res, $Val extends TvCredits>
    implements $TvCreditsCopyWith<$Res> {
  _$TvCreditsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_value.copyWith(
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvCreditsImplCopyWith<$Res>
    implements $TvCreditsCopyWith<$Res> {
  factory _$$TvCreditsImplCopyWith(
          _$TvCreditsImpl value, $Res Function(_$TvCreditsImpl) then) =
      __$$TvCreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cast> cast, List<Crew> crew});
}

/// @nodoc
class __$$TvCreditsImplCopyWithImpl<$Res>
    extends _$TvCreditsCopyWithImpl<$Res, _$TvCreditsImpl>
    implements _$$TvCreditsImplCopyWith<$Res> {
  __$$TvCreditsImplCopyWithImpl(
      _$TvCreditsImpl _value, $Res Function(_$TvCreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_$TvCreditsImpl(
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<Crew>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvCreditsImpl implements _TvCredits {
  _$TvCreditsImpl(
      {required final List<Cast> cast, required final List<Crew> crew})
      : _cast = cast,
        _crew = crew;

  factory _$TvCreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvCreditsImplFromJson(json);

  final List<Cast> _cast;
  @override
  List<Cast> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  final List<Crew> _crew;
  @override
  List<Crew> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  @override
  String toString() {
    return 'TvCredits(cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvCreditsImpl &&
            const DeepCollectionEquality().equals(other._cast, _cast) &&
            const DeepCollectionEquality().equals(other._crew, _crew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cast),
      const DeepCollectionEquality().hash(_crew));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvCreditsImplCopyWith<_$TvCreditsImpl> get copyWith =>
      __$$TvCreditsImplCopyWithImpl<_$TvCreditsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvCreditsImplToJson(
      this,
    );
  }
}

abstract class _TvCredits implements TvCredits {
  factory _TvCredits(
      {required final List<Cast> cast,
      required final List<Crew> crew}) = _$TvCreditsImpl;

  factory _TvCredits.fromJson(Map<String, dynamic> json) =
      _$TvCreditsImpl.fromJson;

  @override
  List<Cast> get cast;
  @override
  List<Crew> get crew;
  @override
  @JsonKey(ignore: true)
  _$$TvCreditsImplCopyWith<_$TvCreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
