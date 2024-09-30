import 'package:flutter/material.dart';
import 'package:ideasoft/application/screens/home/route/home_router.dart';
import 'package:ideasoft/application/screens/home/view/home_view.dart';
import 'package:ideasoft/application/screens/home/viewmodel/home_viewmodel.dart';

import 'navigation.dart';

abstract class RouterProtocol {
  Future<T?>? push<T>(Widget page);
  Future<T?>? pushAndRemoveAll<T>(Widget page);
  Future<dynamic> close();
}

class AppRouter extends RouterProtocol {
  @override
  Future<dynamic> close() async {
    return Navigation.pop();
  }

  @override
  Future<T?>? push<T>(Widget page, [PageRouteBuilder<T>? transition]) async {
    return Navigation.push(page: page, transition: transition);
  }

  @override
  Future<T?>? pushAndRemoveAll<T>(Widget page,
      [PageRouteBuilder<T>? transition]) async {
    return Navigation.pushAndRemoveAll(page: page, transition: transition);
  }
}

class MainRouter extends AppRouter {
  static Widget startApp() {
    final router = HomeRouter();
    final viewModel = HomeViewModel(router);
    final view = HomeView(viewModel: viewModel);
    return view;
  }
}
