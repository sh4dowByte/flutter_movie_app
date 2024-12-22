import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_slug.freezed.dart';
part 'search_slug.g.dart';

@freezed
class SearchSlug with _$SearchSlug {
  const factory SearchSlug({
    required String poster,
    required String slug,
    required String title,
    required List<Link> link, // Properti tambahan
  }) = _SearchSlug;

  factory SearchSlug.fromJson(Map<String, dynamic> json) =>
      _$SearchSlugFromJson(json);
}

@freezed
class Link with _$Link {
  const factory Link({
    required String name,
    required String url,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
