import 'package:flutter/material.dart';
import 'package:ideasoft/application/data_provider/model/response/currency/currency.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/new_product_viewmodel.dart';

class NewProductView extends BaseViewProtocol<NewProductViewModel> {
  const NewProductView({Key? key, required NewProductViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürün Ekle"),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text(
          "Kaydet",
        ),
        onPressed: () {
          viewModel.saveButton();
        },
      ),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<NewProductViewModel>(builder: (_, consumer, widget) {
            return Form(
              key: consumer.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: consumer.nameController,
                          validator: consumer.validate,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Ürün ismini giriniz",
                              label: Text("Ürün İsmi")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: consumer.stockAmountController,
                          validator: consumer.validate,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Stok miktarını giriniz",
                              label: Text("Stok Miktarı")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: consumer.priceController,
                          validator: consumer.validate,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Ürün fiyatını giriniz",
                              label: Text("Ürün Fiyatı")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 2),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 4, child: Text("Fiyat Birimi:")),
                            Flexible(
                              child: DropdownButton<Currency>(
                                items: consumer.currency
                                    .map((e) => DropdownMenuItem<Currency>(
                                          value: e,
                                          child: Text("${e.label}"),
                                        ))
                                    .toList(),
                                onChanged: (Currency? value) {
                                  print("C ${value?.label}");
                                  consumer.dropDownValue = value;
                                  consumer.notifty();
                                },
                                hint: const Text(
                                  "Seçiniz",
                                ),
                                value: consumer.dropDownValue,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Stok Tipi
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 2),
                        child: Row(
                          children: [
                            const Expanded(flex: 2, child: Text("Stok Tipi:")),
                            Flexible(
                              child: DropdownButton<StockTypeLabelExtension>(
                                items: consumer.stockTypeLabelList
                                    .map((e) => DropdownMenuItem<
                                            StockTypeLabelExtension>(
                                          value: e,
                                          child: Text("${e.label}"),
                                        ))
                                    .toList(),
                                onChanged: (StockTypeLabelExtension? value) {
                                  print("A ${value?.value}");
                                  consumer.stockTypeLabelListValue = value;
                                  consumer.notifty();
                                },
                                hint: const Text(
                                  "Seçiniz",
                                ),
                                value: consumer.stockTypeLabelListValue,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Hediye DAHİLMİ hasGift
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              flex: 5,
                              child: Text("Kategori gösterilsin  mi?")),
                          Expanded(
                              child: Switch.adaptive(
                                  value: consumer.showCategoryValue,
                                  onChanged: (_) =>
                                      consumer.showCategoryOnChanged(_))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
