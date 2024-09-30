import 'package:json_annotation/json_annotation.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/interfaces/base_network_model.dart';

part '__templateName__.g.dart';

@JsonSerializable()
class __templateNameToPascalCase__
    extends BaseNetworkModel<__templateNameToPascalCase__> {
  late int id;

  __templateNameToPascalCase__();

  factory __templateNameToPascalCase__.fromJson(Map<String, dynamic> json) =>
      _$__templateNameToPascalCase__FromJson(json);
  Map<String, dynamic> toJson() => _$__templateNameToPascalCase__ToJson(this);

  @override
  __templateNameToPascalCase__ fromJson(Map<String, dynamic> json) {
    return __templateNameToPascalCase__.fromJson(json);
  }
}
