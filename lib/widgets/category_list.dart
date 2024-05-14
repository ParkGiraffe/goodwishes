import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list_row.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryListRow(
          firstImageRoute: 'assets/goods.jpeg',
          firstItemName: 'CategoryName',
          secondImageRoute: 'assets/goods.jpeg',
          secondItemName: 'CategoryName',
        ),
        CategoryListRow(
          firstImageRoute: 'assets/goods.jpeg',
          firstItemName: 'CategoryName',
          secondImageRoute: 'assets/goods.jpeg',
          secondItemName: 'CategoryName',
        ),
      ],
    );
  }
}
