part of '../view/product_view.dart';

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
              endActionPane: _endActionPane(consumer, data, index),
              child: Card(
                child: ListTile(
                  title: _showImage(data, index),
                  subtitle: _subtitle(data, index, context),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

Padding _subtitle(List<Product>? data, int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: _name(data, index, context)),
  );
}

ActionPane _endActionPane(
    ProductViewModel consumer, List<Product>? data, int index) {
  return ActionPane(
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
