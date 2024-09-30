import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashView extends BaseViewProtocol<SplashViewModel> {
  const SplashView({Key? key, required SplashViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SplashPage"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<SplashViewModel>(builder: (_, consumer, widget) {
            return Container(
              child: InkWell(
                  onTap: () {
                    consumer.go();
                  },
                  child: const Text("GİT")),
            );
          });
        },
      ),
    );
  }
}
