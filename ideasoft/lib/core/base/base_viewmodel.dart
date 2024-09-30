import 'package:flutter/material.dart';

import '../navigation/router.dart';

abstract class BaseViewModelProtocol extends ChangeNotifier {
  void showLoading();
  void hideLoading();
  void notifty();
}

class BaseViewModel<T extends AppRouter> extends BaseViewModelProtocol {
  final T router;
  BaseViewModel(this.router);

  @override
  void hideLoading() {
    
  }

  @override
  void showLoading() {
    
  }

  @override
  void notifty() {
    notifyListeners();
  }
}

