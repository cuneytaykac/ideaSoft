import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends BaseViewProtocol<HomeViewModel> {
  const HomeView({Key? key, required HomeViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<HomeViewModel>(builder: (_, consumer, widget) {
            return GridView.count(
              crossAxisCount: 1,
              children: [
                InkWell(
                    onTap: () {
                      consumer.showProduct();
                    },
                    child: const Card(child: Center(child: Text("Ürünler")))),
                InkWell(
                    onTap: () {
                      consumer.showCategory();
                    },
                    child:
                        const Card(child: Center(child: Text("Kategoriler")))),
              ],
            );
          });
        },
      ),
    );
  }
}
