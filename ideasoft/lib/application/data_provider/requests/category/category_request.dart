import '../../data_provider_core/base_client.dart';

class CategoryRequest extends BaseClient {
  @override
  String path = "";

  @override
  String method = "GET";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;
  @override
  bool get isFormDataBody => false;

  CategoryRequest({String? s}) {
    path = 'admin-api/categories?s=$s';
  }
}
