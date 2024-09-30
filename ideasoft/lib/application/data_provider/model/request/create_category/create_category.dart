import 'package:ideasoft/application/data_provider/data_provider_core/interfaces/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_category.g.dart';

@JsonSerializable()
class CreateCategory extends BaseNetworkModel<CreateCategory> {
  String? name;
  int? status;
  String? createdAt;

  CreateCategory({this.createdAt, this.name, this.status});

  factory CreateCategory.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCategoryToJson(this);

  @override
  CreateCategory fromJson(Map<String, dynamic> json) {
    return CreateCategory.fromJson(json);
  }
}
