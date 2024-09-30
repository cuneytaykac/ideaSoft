import 'package:flutter/material.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/freezed/sw_error.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/layers/network_executer.dart';
import 'package:ideasoft/application/data_provider/model/response/product/product.dart';
import 'package:ideasoft/application/data_provider/requests/delete_product/delete_product_request.dart';
import 'package:ideasoft/application/data_provider/requests/products/products_request.dart';
import 'package:ideasoft/core/freezed/result_state.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../route/product_router.dart';

class ProductViewModel extends BaseViewModel<ProductRouter> {
  ProductViewModel(super.router);

  void initVm() {
    getProductList();
  }

  TextEditingController searchController = TextEditingController();

  ResultState<List<Product>?, SwError> resultState = const Idle();

  Future<void> getProductList() async {
    resultState = const Pending();
    var result = await NetworkExecuter.shared.execute<Product, List<Product>>(
        route: ProductsRequest(s: searchController.text),
        responseType: Product());
    result.when(success: (data) {
      if (data.isEmpty ?? true) {
        resultState = const Empty();
      } else {
        resultState = Completed(data);
      }
      notifty();
    }, failure: (error) {
      resultState = Failed(SwError(errorMessage: error.localizedErrorMessage));
      notifty();
    });
  }

  Future<void> deleteProduct(int? id) async {
    var result = await NetworkExecuter.shared.executeResponse(
      route: DeleteProductRequest(id: id),
    );
    result.when(
        success: (data) {
          getProductList();
        },
        failure: (error) {});
    notifty();
  }

  void addProduct() {
    router.showNewProduct();
  }
}
