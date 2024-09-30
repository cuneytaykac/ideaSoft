import '../../../../core/navigation/router.dart';
import 'category_router.dart';
import '../view/category_view.dart';
import '../viewmodel/category_viewmodel.dart';

mixin CategoryRoute on AppRouter {

  Future<dynamic> showCategory() async {
    final router = CategoryRouter();
    final viewModel = CategoryViewModel(router);
    final view = CategoryView(viewModel: viewModel);
    return push(view);
  }
}