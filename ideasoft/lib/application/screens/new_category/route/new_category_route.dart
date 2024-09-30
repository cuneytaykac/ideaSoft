import '../../../../core/navigation/router.dart';
import 'new_category_router.dart';
import '../view/new_category_view.dart';
import '../viewmodel/new_category_viewmodel.dart';

mixin NewCategoryRoute on AppRouter {

  Future<dynamic> showNewCategory() async {
    final router = NewCategoryRouter();
    final viewModel = NewCategoryViewModel(router);
    final view = NewCategoryView(viewModel: viewModel);
    return push(view);
  }
}