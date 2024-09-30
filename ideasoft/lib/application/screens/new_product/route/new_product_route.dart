import '../../../../core/navigation/router.dart';
import 'new_product_router.dart';
import '../view/new_product_view.dart';
import '../viewmodel/new_product_viewmodel.dart';

mixin NewProductRoute on AppRouter {

  Future<dynamic> showNewProduct() async {
    final router = NewProductRouter();
    final viewModel = NewProductViewModel(router);
    final view = NewProductView(viewModel: viewModel);
    return push(view);
  }
}