// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_slug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchSlugImpl _$$SearchSlugImplFromJson(Map<String, dynamic> json) =>
    _$SearchSlugImpl(
      poster: json['poster'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      link: (json['link'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchSlugImplToJson(_$SearchSlugImpl instance) =>
    <String, dynamic>{
      'poster': instance.poster,
      'slug': instance.slug,
      'title': instance.title,
      'link': instance.link,
    };

_$LinkImpl _$$LinkImplFromJson(Map<String, dynamic> json) => _$LinkImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$LinkImplToJson(_$LinkImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
