import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/freezed/sw_error.dart';
import 'package:ideasoft/application/data_provider/model/response/category/category.dart';
import 'package:ideasoft/application/data_provider/model/response/product/product.dart';
import 'package:ideasoft/core/extension/size_extension.dart';
import 'package:ideasoft/core/result_state_builder/result_state_builder.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/product_viewmodel.dart';

part '../widget/_appbar.dart';
part '../widget/_body.dart';
part '../widget/_categoryList.dart';
part '../widget/_fab.dart';
part '../widget/_product.dart';
part '../widget/_searchbar.dart';

class ProductView extends BaseViewProtocol<ProductViewModel> {
  const ProductView({Key? key, required ProductViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {
    viewModel.getProductList();
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: _appbar(viewModel),
      floatingActionButton: _fab(viewModel),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<ProductViewModel>(builder: (_, consumer, widget) {
            return _body(consumer);
          });
        },
      ),
    );
  }
}
