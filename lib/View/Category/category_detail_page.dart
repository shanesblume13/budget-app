import 'package:budget/Model/category.dart';
import 'package:budget/View/Category/components/categories_count.dart';
import 'package:budget/View/Category/components/category_detail_card.dart';
import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({
    Key key,
    this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CategoryDetailCard(category: category),
            ),
            CategoriesCount(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
