part of '../view/product_view.dart';

TextFormField _searchbar(ProductViewModel consumer) {
  return TextFormField(
    controller: consumer.searchController,
    onChanged: (_) {
      consumer.getProductList();
    },
    decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Aramak istediginiz ürünü yazınız..."),
  );
}
