import '../../../../core/navigation/router.dart';
import '../view/new_category_view.dart';
import '../viewmodel/new_category_viewmodel.dart';
import 'new_category_router.dart';

mixin NewCategoryRoute on AppRouter {
  Future<dynamic> showNewCategory() async {
    final router = NewCategoryRouter();
    final viewModel = NewCategoryViewModel(router);
    final view = NewCategoryView(viewModel: viewModel);
    return push(view);
  }

  Future<dynamic> showEditCategory({int? id, String? name, int? status}) async {
    final router = NewCategoryRouter();
    final viewModel = NewCategoryViewModel(router);
    viewModel.id = id;
    viewModel.statusValue = (status == 0 ? false : true);
    viewModel.nameController.text = '$name';
    final view = NewCategoryView(viewModel: viewModel);
    return push(view);
  }
}
