import 'package:json_annotation/json_annotation.dart';

import '../../../data_provider_core/interfaces/base_network_model.dart';

part 'images.g.dart';

@JsonSerializable()
class Images extends BaseNetworkModel<Images> {
  int? id;
  String? filename;
  String? extension;
  String? thumbUrl;
  String? originalUrl;

  Images(
      {this.extension,
      this.filename,
      this.id,
      this.originalUrl,
      this.thumbUrl});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  @override
  Images fromJson(Map<String, dynamic> json) {
    return Images.fromJson(json);
  }
}
