import 'package:ideasoft/application/data_provider/model/request/create_category/create_category.dart';

import '../../data_provider_core/base_client.dart';

class CreateCategoryRequest extends BaseClient {
  @override
  String path = "admin-api/categories";

  @override
  String method = "POST";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;

  @override
  bool get isFormDataBody => false;

  CreateCategoryRequest(CreateCategory? data) {
    body = data?.toJson();
  }
}
