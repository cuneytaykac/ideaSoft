import 'package:flutter/material.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/layers/network_executer.dart';
import 'package:ideasoft/application/data_provider/model/request/create_category/create_category.dart';
import 'package:ideasoft/application/data_provider/requests/create_category/create_category_request.dart';
import 'package:ideasoft/application/data_provider/requests/update_category/update_category_request.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../route/new_category_router.dart';

class NewCategoryViewModel extends BaseViewModel<NewCategoryRouter> {
  NewCategoryViewModel(super.router);
  TextEditingController nameController = TextEditingController();

  String? validate(String? value) {
    if (value!.isEmpty) {
      return "Boş geçilemez";
    }
    return null;
  }

  bool statusValue = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  void statusOnChanged(bool value) {
    statusValue = value;
    notifty();
  }

  CreateCategory requestData = CreateCategory();
  void saveButton() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      requestData
        ..createdAt = '${DateTime.now()}'
        ..name = nameController.text
        ..status = (statusValue == false ? 0 : 1);
      id == null ? _createCategory(requestData) : _updateData(requestData);
    } else {}
  }

  Future<void> _createCategory(CreateCategory data) async {
    var result = await NetworkExecuter.shared.executeResponse(
      route: CreateCategoryRequest(data),
    );
    result.when(
        success: (data) {
          requestData = CreateCategory();
          router.close();
        },
        failure: (error) {});
    notifty();
  }

  //Update
  int? id;
  Future<void> _updateData(CreateCategory data) async {
    var result = await NetworkExecuter.shared.executeResponse(
      route: UpdateCategoryRequest(id: id, data: data),
    );
    result.when(
        success: (data) {
          requestData = CreateCategory();
          router.close();
        },
        failure: (error) {});
    notifty();
  }

  void disposeVM() {
    id = null;
    requestData = CreateCategory();
  }
}
