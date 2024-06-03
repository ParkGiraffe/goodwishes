import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/category_list_row.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<CategoryListProvider>(context).categoryList;

    // return const Column(
    //   children: [
    //     CategoryListRow(
    //       firstImageRoute: 'assets/goods.jpeg',
    //       firstItemName: 'CategoryName',
    //       secondImageRoute: 'assets/goods.jpeg',
    //       secondItemName: 'CategoryName',
    //     ),
    //   ],
    // );

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (categoryList.length / 2).ceil(),
      itemBuilder: (context, index) {
        if (index * 2 + 1 >= categoryList.length) {
          return CategoryListRow(
            firstImageRoute: 'assets/goods.jpeg',
            firstItemName: categoryList[index * 2].categoryName,
            // secondItemName: categoryList[index * 2 + 1].categoryName,
          );
        } else {
          return CategoryListRow(
            firstImageRoute: 'assets/goods.jpeg',
            firstItemName: categoryList[index * 2].categoryName,
            secondImageRoute: 'assets/goods.jpeg',
            secondItemName: categoryList[index * 2 + 1].categoryName,
          );
        }
      },
    );
  }
}
