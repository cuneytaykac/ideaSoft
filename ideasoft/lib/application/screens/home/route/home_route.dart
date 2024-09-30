import '../../../../core/navigation/router.dart';
import '../view/home_view.dart';
import '../viewmodel/home_viewmodel.dart';
import 'home_router.dart';

mixin HomeRoute on AppRouter {
  Future<dynamic> showHome() async {
    final router = HomeRouter();
    final viewModel = HomeViewModel(
      router,
    );
    final view = HomeView(viewModel: viewModel);
    return push(view);
  }
}
