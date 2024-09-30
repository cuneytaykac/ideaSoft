import '../../../../core/base/base_viewmodel.dart';
import '../route/home_router.dart';

class HomeViewModel extends BaseViewModel<HomeRouter> {
  HomeViewModel(
    super.router,
  );

  void showProduct() {
    router.showProduct();
  }
}
