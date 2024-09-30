import 'package:ideasoft/application/data_provider/model/request/create_category/create_category.dart';

import '../../data_provider_core/base_client.dart';

class UpdateCategoryRequest extends BaseClient {
  @override
  String path = "";

  @override
  String method = "PUT";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;

  @override
  bool get isFormDataBody => false;

  UpdateCategoryRequest({int? id, CreateCategory? data}) {
    path = 'admin-api/categories/$id';
    body = data?.toJson();
  }
}
