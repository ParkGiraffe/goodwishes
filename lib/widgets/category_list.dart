import 'dart:ffi';
import 'dart:typed_data';

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
    final goodsList = Provider.of<GoodsListProvider>(context);
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
        Uint8List leftImage = goodsList.goodsList
            .firstWhere(
                (element) =>
                    element.category ==
                    categoryList.elementAt(index * 2).categoryName,
                orElse: () => goodsList.goodsList.elementAt(0))
            .thumbnail;

        if (index * 2 + 1 >= categoryList.length) {
          return CategoryListRow(
            firstImageRoute: leftImage,
            firstItemName: categoryList.elementAt(index * 2).categoryName,
            // secondItemName: categoryList.elementAt(index * 2 + 1).categoryName,
          );
        } else {
          Uint8List rightImage = goodsList.goodsList
              .firstWhere(
                  (element) =>
                      element.category ==
                      categoryList.elementAt(index * 2 + 1).categoryName,
                  orElse: () => goodsList.goodsList.elementAt(0))
              .thumbnail;

          // print(rightImage);
          return CategoryListRow(
            firstImageRoute: leftImage,
            firstItemName: categoryList.elementAt(index * 2).categoryName,
            secondImageRoute: rightImage,
            secondItemName: categoryList.elementAt(index * 2 + 1).categoryName,
          );
        }
      },
    );
  }
}
