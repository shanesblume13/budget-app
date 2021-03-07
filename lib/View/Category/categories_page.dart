import 'package:budget/Controller/category_controller.dart';
import 'package:budget/View/Category/components/categories_count.dart';
import 'package:budget/View/Category/components/categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  final CategoryController categoryCnotroller = Get.put(CategoryController());

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CategoriesListView(),
            ),
            CategoriesCount(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
