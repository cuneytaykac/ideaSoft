import 'package:ideasoft/application/data_provider/model/response/currency/currency.dart';
import 'package:ideasoft/application/data_provider/model/response/images/images.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../data_provider_core/interfaces/base_network_model.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseNetworkModel<Product> {
  int? id;
  String? name;
  String? fullName;
  String? slug;
  String? sku;
  String? barcode;
  num? stockAmount;
  num? price1;
  Currency? currency;
  num? discount;
  num? discountType;
  num? taxIncluded;
  String? stockTypeLabel;
  num? customShippingDisabled;
  num? hasGift;
  num? status;
  num? hasOption;
  num? categoryShowcaseStatus;
  DateTime? updatedAt;
  DateTime? createdAt;
  List<Images>? images;

  Product(
      {this.barcode,
      this.categoryShowcaseStatus,
      this.createdAt,
      this.currency,
      this.customShippingDisabled,
      this.discount,
      this.discountType,
      this.fullName,
      this.hasGift,
      this.hasOption,
      this.id,
      this.name,
      this.price1,
      this.sku,
      this.slug,
      this.status,
      this.stockAmount,
      this.stockTypeLabel,
      this.taxIncluded,
      this.updatedAt,
      this.images});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }
}
