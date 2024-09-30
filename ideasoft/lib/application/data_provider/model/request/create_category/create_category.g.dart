// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategory _$CreateCategoryFromJson(Map<String, dynamic> json) =>
    CreateCategory(
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateCategoryToJson(CreateCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
