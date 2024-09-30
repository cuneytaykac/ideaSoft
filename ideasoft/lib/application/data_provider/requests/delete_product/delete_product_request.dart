import '../../data_provider_core/base_client.dart';

class DeleteProductRequest extends BaseClient {
  @override
  String path = "";

  @override
  String method = "DELETE";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;
  @override
  bool isFormDataBody = false;

  DeleteProductRequest({int? id}) {
    path = 'admin-api/products/$id';
  }
}
