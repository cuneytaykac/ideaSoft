import '../../data_provider_core/base_client.dart';

class ProductsRequest extends BaseClient {
  @override
  String path = "admin-api/products";

  @override
  String method = "GET";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;

  ProductsRequest({
    String? s,
  });

  @override
  bool get isFormDataBody => false;
}
