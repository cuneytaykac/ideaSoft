import '../../../../core/navigation/router.dart';
import 'product_router.dart';
import '../view/product_view.dart';
import '../viewmodel/product_viewmodel.dart';

mixin ProductRoute on AppRouter {

  Future<dynamic> showProduct() async {
    final router = ProductRouter();
    final viewModel = ProductViewModel(router);
    final view = ProductView(viewModel: viewModel);
    return push(view);
  }
}