import 'package:ideasoft/application/data_provider/data_provider_core/interfaces/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends BaseNetworkModel<Category> {
  int? id;
  String? name;
  String? slug;
  num? sortOrder;
  num? status;
  String? imageUrl;
  DateTime? createdAt;
  Category(
      {this.createdAt,
      this.id,
      this.imageUrl,
      this.name,
      this.slug,
      this.sortOrder,
      this.status});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  Category fromJson(Map<String, dynamic> json) {
    return Category.fromJson(json);
  }
}
