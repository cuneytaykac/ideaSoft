part of '../view/product_view.dart';

AppBar _appbar(ProductViewModel viewModel) {
  return AppBar(
    title: const Text("Ürünler"),
    actions: [
      TextButton(
          onPressed: () {
            viewModel.showCategory();
          },
          child: const Text("Kategoriler"))
    ],
  );
}
