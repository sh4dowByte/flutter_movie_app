// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_slug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchSlug _$SearchSlugFromJson(Map<String, dynamic> json) {
  return _SearchSlug.fromJson(json);
}

/// @nodoc
mixin _$SearchSlug {
  String get poster => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<Link> get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSlugCopyWith<SearchSlug> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSlugCopyWith<$Res> {
  factory $SearchSlugCopyWith(
          SearchSlug value, $Res Function(SearchSlug) then) =
      _$SearchSlugCopyWithImpl<$Res, SearchSlug>;
  @useResult
  $Res call({String poster, String slug, String title, List<Link> link});
}

/// @nodoc
class _$SearchSlugCopyWithImpl<$Res, $Val extends SearchSlug>
    implements $SearchSlugCopyWith<$Res> {
  _$SearchSlugCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poster = null,
    Object? slug = null,
    Object? title = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as List<Link>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSlugImplCopyWith<$Res>
    implements $SearchSlugCopyWith<$Res> {
  factory _$$SearchSlugImplCopyWith(
          _$SearchSlugImpl value, $Res Function(_$SearchSlugImpl) then) =
      __$$SearchSlugImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String poster, String slug, String title, List<Link> link});
}

/// @nodoc
class __$$SearchSlugImplCopyWithImpl<$Res>
    extends _$SearchSlugCopyWithImpl<$Res, _$SearchSlugImpl>
    implements _$$SearchSlugImplCopyWith<$Res> {
  __$$SearchSlugImplCopyWithImpl(
      _$SearchSlugImpl _value, $Res Function(_$SearchSlugImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poster = null,
    Object? slug = null,
    Object? title = null,
    Object? link = null,
  }) {
    return _then(_$SearchSlugImpl(
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value._link
          : link // ignore: cast_nullable_to_non_nullable
              as List<Link>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSlugImpl implements _SearchSlug {
  const _$SearchSlugImpl(
      {required this.poster,
      required this.slug,
      required this.title,
      required final List<Link> link})
      : _link = link;

  factory _$SearchSlugImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSlugImplFromJson(json);

  @override
  final String poster;
  @override
  final String slug;
  @override
  final String title;
  final List<Link> _link;
  @override
  List<Link> get link {
    if (_link is EqualUnmodifiableListView) return _link;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_link);
  }

  @override
  String toString() {
    return 'SearchSlug(poster: $poster, slug: $slug, title: $title, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSlugImpl &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._link, _link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, poster, slug, title,
      const DeepCollectionEquality().hash(_link));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSlugImplCopyWith<_$SearchSlugImpl> get copyWith =>
      __$$SearchSlugImplCopyWithImpl<_$SearchSlugImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSlugImplToJson(
      this,
    );
  }
}

abstract class _SearchSlug implements SearchSlug {
  const factory _SearchSlug(
      {required final String poster,
      required final String slug,
      required final String title,
      required final List<Link> link}) = _$SearchSlugImpl;

  factory _SearchSlug.fromJson(Map<String, dynamic> json) =
      _$SearchSlugImpl.fromJson;

  @override
  String get poster;
  @override
  String get slug;
  @override
  String get title;
  @override
  List<Link> get link;
  @override
  @JsonKey(ignore: true)
  _$$SearchSlugImplCopyWith<_$SearchSlugImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Link _$LinkFromJson(Map<String, dynamic> json) {
  return _Link.fromJson(json);
}

/// @nodoc
mixin _$Link {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkCopyWith<Link> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkCopyWith<$Res> {
  factory $LinkCopyWith(Link value, $Res Function(Link) then) =
      _$LinkCopyWithImpl<$Res, Link>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$LinkCopyWithImpl<$Res, $Val extends Link>
    implements $LinkCopyWith<$Res> {
  _$LinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkImplCopyWith<$Res> implements $LinkCopyWith<$Res> {
  factory _$$LinkImplCopyWith(
          _$LinkImpl value, $Res Function(_$LinkImpl) then) =
      __$$LinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$LinkImplCopyWithImpl<$Res>
    extends _$LinkCopyWithImpl<$Res, _$LinkImpl>
    implements _$$LinkImplCopyWith<$Res> {
  __$$LinkImplCopyWithImpl(_$LinkImpl _value, $Res Function(_$LinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$LinkImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkImpl implements _Link {
  const _$LinkImpl({required this.name, required this.url});

  factory _$LinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'Link(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkImplCopyWith<_$LinkImpl> get copyWith =>
      __$$LinkImplCopyWithImpl<_$LinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkImplToJson(
      this,
    );
  }
}

abstract class _Link implements Link {
  const factory _Link({required final String name, required final String url}) =
      _$LinkImpl;

  factory _Link.fromJson(Map<String, dynamic> json) = _$LinkImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$LinkImplCopyWith<_$LinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
