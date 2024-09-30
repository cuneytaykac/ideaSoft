// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: (json['id'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      sortOrder: json['sortOrder'] as num?,
      status: json['status'] as num?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'sortOrder': instance.sortOrder,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
