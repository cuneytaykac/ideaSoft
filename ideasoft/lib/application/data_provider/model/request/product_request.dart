import 'package:ideasoft/application/data_provider/model/response/currency/currency.dart';

class ProductRequestModel {
  String? name;
  String? sku;
  int? stockAmount;
  int? price1;
  Currency? currency;
  int? status;
  String? stockTypeLabel;
  int? taxIncluded;
  int? categoryShowcaseStatus;
  int? hasGift;
  int? discountType;

  ProductRequestModel(
      {this.name,
      this.sku,
      this.stockAmount,
      this.price1,
      this.currency,
      this.status,
      this.stockTypeLabel,
      this.taxIncluded,
      this.categoryShowcaseStatus,
      this.hasGift,
      this.discountType});

  ProductRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sku = json['sku'];
    stockAmount = json['stockAmount'];
    price1 = json['price1'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    status = json['status'];
    stockTypeLabel = json['stockTypeLabel'];
    taxIncluded = json['taxIncluded'];
    categoryShowcaseStatus = json['categoryShowcaseStatus'];
    hasGift = json['hasGift'];
    discountType = json['discountType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['sku'] = sku;
    data['stockAmount'] = stockAmount;
    data['price1'] = price1;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['status'] = status;
    data['stockTypeLabel'] = stockTypeLabel;
    data['taxIncluded'] = taxIncluded;
    data['categoryShowcaseStatus'] = categoryShowcaseStatus;
    data['hasGift'] = hasGift;
    data['discountType'] = discountType;
    return data;
  }
}
