import 'package:flutter/material.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/freezed/sw_error.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/layers/network_executer.dart';
import 'package:ideasoft/application/data_provider/model/response/category/category.dart';
import 'package:ideasoft/application/data_provider/requests/category/category_request.dart';
import 'package:ideasoft/core/freezed/result_state.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../route/category_router.dart';

class CategoryViewModel extends BaseViewModel<CategoryRouter> {
  CategoryViewModel(super.router);
  TextEditingController searchController = TextEditingController();

  ResultState<List<Category>?, SwError> resultState = const Idle();

  Future<void> getCategoryList() async {
    resultState = const Pending();
    var result = await NetworkExecuter.shared.execute<Category, List<Category>>(
        route: CategoryRequest(s: searchController.text),
        responseType: Category());
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
}
