import 'package:ideasoft/application/data_provider/model/request/product_request.dart';

import '../../data_provider_core/base_client.dart';

class CreateProductRequest extends BaseClient {
  @override
  String path = "admin-api/products";

  @override
  String method = "POST";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;
  @override
  bool get isFormDataBody => false;

  CreateProductRequest({ProductRequestModel? data}) {
    body = data?.toJson();
    /**
    *  body = {
      "name": "Deneme Ürün123",
      "sku": "ff927389-f875-4775-b373-49a9ae574d70111233",
      "stockAmount": 10,
      "price1": 10,
      "currency": {"id": 1, "label": "USD", "abbr": "USD"},
      "status": 0,
      "stockTypeLabel": "Package",
      "taxIncluded": 1,
      "categoryShowcaseStatus": 1,
      "hasGift": 1,
      "discountType": 1
    };
    */
  }
}
