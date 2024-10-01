import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ideasoft/application/data_provider/data_provider_core/freezed/sw_error.dart';
import 'package:ideasoft/application/data_provider/model/response/product/product.dart';
import 'package:ideasoft/core/extension/size_extension.dart';
import 'package:ideasoft/core/result_state_builder/result_state_builder.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/theme/core/theme_manager.dart';
import '../viewmodel/product_viewmodel.dart';

class ProductView extends BaseViewProtocol<ProductViewModel> {
  const ProductView({Key? key, required ProductViewModel viewModel})
      : super(viewModel, key: key);

  @override
  void dispose() {}

  @override
  void init() {
    viewModel
      ..getCategoryList()
      ..getProductList();
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünler"),
        actions: [
          TextButton(
              onPressed: () {
                viewModel.showCategory();
              },
              child: const Text("Kategoriler"))
        ],
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            viewModel.addProduct();
          },
          child: const Text("Ürün Ekle")),
      body: ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<ProductViewModel>(builder: (_, consumer, widget) {
            return _body(consumer);
          });
        },
      ),
    );
  }

  Padding _body(ProductViewModel consumer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: _searchbar(consumer),
          ),
          Expanded(
            flex: 2,
            child: ResultStateBuilder(
                resultState: consumer.categoryResultState,
                completed: (data) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: data?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          consumer.selectCategory(data![index]);
                        },
                        child: SizedBox(
                          width: context.screenWidht(.3),
                          child: Card(
                            elevation: 3,
                            color: data?[index].isSelected == false
                                ? null
                                : Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Center(child: Text('${data?[index].name}')),
                          ),
                        ),
                      );
                    })),
          ),
          Expanded(flex: 12, child: _product(consumer)),
        ],
      ),
    );
  }

  ResultStateBuilder<List<Product>?, SwError> _product(
      ProductViewModel consumer) {
    return ResultStateBuilder(
      resultState: consumer.resultState,
      completed: (data) {
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            await consumer.getProductList();
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
                          consumer.deleteProduct(data?[index].id);
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
                    title: _showImage(data, index),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _name(data, index, context),
                          Row(
                            children: [
                              const Expanded(flex: 1, child: Text("Fiyat")),
                              Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "${data?[index].price1}",
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Text(
                                          "${data?[index].currency?.label}",
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
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
    );
  }

  Text _name(List<Product>? data, int index, BuildContext context) {
    return Text(
      "${data?[index].name}",
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  TextFormField _searchbar(ProductViewModel consumer) {
    return TextFormField(
      controller: consumer.searchController,
      onChanged: (_) {
        consumer.getProductList();
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Aramak istediginiz ürünü yazınız..."),
    );
  }

  Widget _showImage(List<Product>? data, int index) {
    return data?[index].images?.isNotEmpty == true
        ? CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: 'https:${data?[index].images?.first.originalUrl}',
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: context.screenWidht(1),
                height: context.screenHeight(.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
                const CircularProgressIndicator.adaptive(),
            imageBuilder: (context, imageProvider) => Container(
              width: context.screenWidht(1),
              height: context.screenHeight(.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
              ),
            ),
          )
        : const SizedBox();
  }
}
