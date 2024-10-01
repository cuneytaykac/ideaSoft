part of '../view/product_view.dart';

ElevatedButton _fab(ProductViewModel viewModel) {
  return ElevatedButton(
      onPressed: () {
        viewModel.addProduct();
      },
      child: const Text("Ürün Ekle"));
}
