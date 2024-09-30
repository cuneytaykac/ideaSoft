import '../../data_provider_core/base_client.dart';

class DeleteCategoryRequest extends BaseClient {
  @override
  String path = "";

  @override
  String method = "DELETE";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;

  @override
  bool get isFormDataBody => false;

  DeleteCategoryRequest({int? id}) {
    path = 'admin-api/categories/$id';
  }
}
