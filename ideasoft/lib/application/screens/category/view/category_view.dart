import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ideasoft/application/components/image/category_image.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/freezed/sw_error.dart';
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
      appBar: _appbar(),
      floatingActionButton: _fab(),
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
                  Expanded(flex: 8, child: _categoryList(consumer)),
                ],
              ),
            );
          });
        },
      ),
    );
  }

  ElevatedButton _fab() {
    return ElevatedButton(
        onPressed: () {
          viewModel.showNewCategory();
        },
        child: const Text("Kategori Ekle"));
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text("Kategoriler"),
    );
  }

  ResultStateBuilder<List<Category>?, SwError> _categoryList(
      CategoryViewModel consumer) {
    return ResultStateBuilder(
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
                          consumer.deleteCategory(data?[index].id);
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
                    leading: _leading(data, index),
                    subtitle: _subtitle(data, index, context),
                    trailing: _trailing(consumer, data, index),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  IconButton _trailing(
      CategoryViewModel consumer, List<Category>? data, int index) {
    return IconButton(
      onPressed: () {
        consumer.editCategory(
            id: data?[index].id,
            name: data?[index].name,
            status: int.parse('${data?[index].status}'));
      },
      icon: const Icon(Icons.edit),
    );
  }

  Padding _subtitle(List<Category>? data, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _name(data, index, context),
        ],
      ),
    );
  }

  CategoryImage _leading(List<Category>? data, int index) {
    return CategoryImage(imageUrl: '${data?[index].imageUrl}');
  }
}

Text _name(List<Category>? data, int index, BuildContext context) {
  return Text(
    "${data?[index].name}",
    textAlign: TextAlign.start,
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
