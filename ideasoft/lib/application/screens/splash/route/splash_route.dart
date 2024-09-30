import '../../../../core/navigation/router.dart';
import 'splash_router.dart';
import '../view/splash_view.dart';
import '../viewmodel/splash_viewmodel.dart';

mixin SplashRoute on AppRouter {

  Future<dynamic> showSplash() async {
    final router = SplashRouter();
    final viewModel = SplashViewModel(router);
    final view = SplashView(viewModel: viewModel);
    return push(view);
  }
}