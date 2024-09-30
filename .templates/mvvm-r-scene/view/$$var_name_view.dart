import 'package:flutter/material.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../../../../core/base/base_view.dart';
import '../viewmodel/__templateName___viewmodel.dart';
import 'package:provider/provider.dart';

class __templateNameToPascalCase__View extends BaseViewProtocol<__templateNameToPascalCase__ViewModel> {
  const __templateNameToPascalCase__View({Key? key, required __templateNameToPascalCase__ViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("__templateNameToPascalCase__Page"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<__templateNameToPascalCase__ViewModel>(builder: (_, consumer, widget) {
            return Container();
          });
        },
      ),
    );
  }
}
