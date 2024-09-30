import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/new_category_viewmodel.dart';

class NewCategoryView extends BaseViewProtocol<NewCategoryViewModel> {
  const NewCategoryView({Key? key, required NewCategoryViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {
    viewModel.disposeVM();
  }

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(viewModel.id == null ? "Kategori Ekle" : "Kategori Güncelle"),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            viewModel.saveButton();
          },
          child: Text(viewModel.id == null ? "Ekle" : "Güncelle")),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<NewCategoryViewModel>(builder: (_, consumer, widget) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: SingleChildScrollView(
                child: Form(
                  key: consumer.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: consumer.nameController,
                          validator: consumer.validate,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Kategori ismini giriniz",
                              label: Text("Kategori İsmi")),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(flex: 5, child: Text("Aktif")),
                          Expanded(
                              child: Switch.adaptive(
                                  value: consumer.statusValue,
                                  onChanged: (_) =>
                                      consumer.statusOnChanged(_))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
