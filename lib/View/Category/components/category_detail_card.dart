import 'package:budget/Model/category.dart';
import 'package:flutter/material.dart';

class CategoryDetailCard extends StatelessWidget {
  const CategoryDetailCard({
    Key key,
    this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
