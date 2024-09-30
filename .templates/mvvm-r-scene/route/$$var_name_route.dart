import '../../../../core/navigation/router.dart';
import '__templateName___router.dart';
import '../view/__templateName___view.dart';
import '../viewmodel/__templateName___viewmodel.dart';

mixin __templateNameToPascalCase__Route on AppRouter {

  Future<dynamic> show__templateNameToPascalCase__() async {
    final router = __templateNameToPascalCase__Router();
    final viewModel = __templateNameToPascalCase__ViewModel(router);
    final view = __templateNameToPascalCase__View(viewModel: viewModel);
    return push(view);
  }
}