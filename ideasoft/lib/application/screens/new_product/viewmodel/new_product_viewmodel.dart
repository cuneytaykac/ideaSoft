import 'package:flutter/material.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/layers/network_executer.dart';
import 'package:ideasoft/application/data_provider/model/request/product_request.dart';
import 'package:ideasoft/application/data_provider/model/response/currency/currency.dart';
import 'package:ideasoft/application/data_provider/requests/create_product/create_product_request.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../route/new_product_router.dart';

class NewProductViewModel extends BaseViewModel<NewProductRouter> {
  NewProductViewModel(super.router);

  List<Currency> currency = [
    Currency(id: 1, label: "USD", abbr: "USD"),
    Currency(id: 2, label: "EURO", abbr: "EUR"),
    Currency(id: 3, label: "TL", abbr: "TL"),
  ];
  List<StockTypeLabelExtension> stockTypeLabelList = [
    StockTypeLabelExtension.cm,
    StockTypeLabelExtension.dozen,
    StockTypeLabelExtension.piece,
    StockTypeLabelExtension.gram,
    StockTypeLabelExtension.kg,
    StockTypeLabelExtension.person,
    StockTypeLabelExtension.package,
    StockTypeLabelExtension.metre,
    StockTypeLabelExtension.m2,
    StockTypeLabelExtension.pair
  ];
  Currency? dropDownValue;
  StockTypeLabelExtension? stockTypeLabelListValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController stockAmountController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  bool showCategoryValue = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  void showCategoryOnChanged(bool value) {
    showCategoryValue = value;
    notifty();
  }

  ProductRequestModel data = ProductRequestModel();
  String? validate(String? value) {
    if (value!.isEmpty) {
      return "Boş geçilemez";
    }
    return null;
  }

  void saveButton() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      data
        ..name = nameController.text
        ..sku = const Uuid().v4()
        ..stockAmount = int.tryParse(stockAmountController.text)
        ..price1 = int.tryParse(priceController.text)
        ..currency = dropDownValue
        ..discountType = 1
        ..taxIncluded = 1
        ..stockTypeLabel = stockTypeLabelListValue?.value
        ..hasGift = 0
        ..status = 0
        ..categoryShowcaseStatus = showCategoryValue == false ? 0 : 1;
      _createProduct(data);
    } else {}
  }

  Future<void> _createProduct(ProductRequestModel data) async {
    var result = await NetworkExecuter.shared.executeResponse(
      route: CreateProductRequest(data: data),
    );
    result.when(
        success: (data) {
          router.close();
        },
        failure: (error) {});
    notifty();
  }
}

enum StockTypeLabelExtension {
  piece(label: "Adet", value: "Piece"),
  cm(label: "Santimetre", value: "cm"),
  dozen(label: "Düzine", value: "Dozen"),
  gram(label: "Gram", value: "gram"),
  kg(label: "Kilogram", value: "kg"),
  person(label: "Kişi", value: "Person"),
  package(label: "Paket", value: "Package"),
  metre(label: "Metre", value: "metre"),
  m2(label: "Metrekare", value: "m2"),
  pair(label: "Çift", value: "pair");

  final String? label;
  final String? value;

  const StockTypeLabelExtension({
    this.label,
    this.value,
  });
}
