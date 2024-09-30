import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ideasoft/application/data_provider/model/response/category/category.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/result_state_builder/result_state_builder.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/category_viewmodel.dart';

class CategoryView extends BaseViewProtocol<CategoryViewModel> {
  const CategoryView({Key? key, required CategoryViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {
    viewModel.getCategoryList();
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoriler"),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            viewModel.showNewCategory();
          },
          child: const Text("Kategori Ekle")),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<CategoryViewModel>(builder: (_, consumer, widget) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Column(
                children: [
                  Expanded(
                    child: _searchbar(consumer),
                  ),
                  Expanded(
                      flex: 8,
                      child: ResultStateBuilder(
                        resultState: consumer.resultState,
                        completed: (data) {
                          return RefreshIndicator.adaptive(
                            onRefresh: () async {
                              await consumer.getCategoryList();
                            },
                            child: ListView.builder(
                              itemCount: data?.length,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  key: ValueKey(index),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      Visibility(
                                        child: SlidableAction(
                                          onPressed: (context) async {
                                            /**
                                            *  consumer
                                                .deleteProduct(data?[index].id);
                                            */
                                          },
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    child: ListTile(
                                      //title: _showImage(data, index),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            _name(data, index, context),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}

Text _name(List<Category>? data, int index, BuildContext context) {
  return Text(
    "${data?[index].name}",
    style: Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.bold),
  );
}

TextFormField _searchbar(CategoryViewModel consumer) {
  return TextFormField(
    controller: consumer.searchController,
    onChanged: (_) {
      consumer.getCategoryList();
    },
    decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Aramak istediginiz ürünü yazınız..."),
  );
}
