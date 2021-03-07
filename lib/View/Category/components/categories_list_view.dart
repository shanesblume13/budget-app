import 'package:budget/Controller/category_controller.dart';
import 'package:budget/Model/category.dart';
import 'package:budget/View/Category/components/category_list_tile.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CategoryController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          Category category = controller.categoryList[index];

          return CategoryListTile(category: category);
        },
      );
    });
  }
}
