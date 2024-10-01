part of '../view/product_view.dart';

ResultStateBuilder<List<Category>?, SwError> _categoryList(
    ProductViewModel consumer) {
  return ResultStateBuilder(
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
                  color:
                      data?[index].isSelected == false ? null : Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 2),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Center(child: Text('${data?[index].name}')),
                ),
              ),
            );
          }));
}
