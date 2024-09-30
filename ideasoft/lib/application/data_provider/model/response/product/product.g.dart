// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      barcode: json['barcode'] as String?,
      categoryShowcaseStatus: json['categoryShowcaseStatus'] as num?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      customShippingDisabled: json['customShippingDisabled'] as num?,
      discount: json['discount'] as num?,
      discountType: json['discountType'] as num?,
      fullName: json['fullName'] as String?,
      hasGift: json['hasGift'] as num?,
      hasOption: json['hasOption'] as num?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price1: json['price1'] as num?,
      sku: json['sku'] as String?,
      slug: json['slug'] as String?,
      status: json['status'] as num?,
      stockAmount: json['stockAmount'] as num?,
      stockTypeLabel: json['stockTypeLabel'] as String?,
      taxIncluded: json['taxIncluded'] as num?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'slug': instance.slug,
      'sku': instance.sku,
      'barcode': instance.barcode,
      'stockAmount': instance.stockAmount,
      'price1': instance.price1,
      'currency': instance.currency,
      'discount': instance.discount,
      'discountType': instance.discountType,
      'taxIncluded': instance.taxIncluded,
      'stockTypeLabel': instance.stockTypeLabel,
      'customShippingDisabled': instance.customShippingDisabled,
      'hasGift': instance.hasGift,
      'status': instance.status,
      'hasOption': instance.hasOption,
      'categoryShowcaseStatus': instance.categoryShowcaseStatus,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'images': instance.images,
    };
