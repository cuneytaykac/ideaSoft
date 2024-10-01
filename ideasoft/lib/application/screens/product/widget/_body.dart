part of '../view/product_view.dart';

Padding _body(ProductViewModel consumer) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: _searchbar(consumer),
        ),
        Expanded(
          flex: 2,
          child: _categoryList(consumer),
        ),
        Expanded(flex: 12, child: _product(consumer)),
      ],
    ),
  );
}
