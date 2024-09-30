// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      extension: json['extension'] as String?,
      filename: json['filename'] as String?,
      id: (json['id'] as num?)?.toInt(),
      originalUrl: json['originalUrl'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'extension': instance.extension,
      'thumbUrl': instance.thumbUrl,
      'originalUrl': instance.originalUrl,
    };
