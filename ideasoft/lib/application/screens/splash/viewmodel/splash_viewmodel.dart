import '../../../../core/base/base_viewmodel.dart';
import '../route/splash_router.dart';

class SplashViewModel extends BaseViewModel<SplashRouter> {
  SplashViewModel(super.router);

  void go() {
    router.showHome();
  }
}
