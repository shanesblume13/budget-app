import 'package:budget/Controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCount extends StatelessWidget {
  const CategoriesCount({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: GetX<CategoryController>(builder: (controller) {
        return Text('Category Count: ${controller.categoryCount.toString()}');
      }),
    );
  }
}
