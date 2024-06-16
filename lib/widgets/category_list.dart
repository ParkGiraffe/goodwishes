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

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (categoryList.length / 2).ceil(),
      itemBuilder: (context, index) {
        Goods leftGoods = goodsList.goodsList.firstWhere(
            (element) =>
                element.category ==
                categoryList.elementAt(index * 2).categoryName,
            orElse: () => Goods.createEmptyGoods());

        if (index * 2 + 1 >= categoryList.length) {
          return CategoryListRow(
            firstImage: leftGoods.id == '' ? null : leftGoods.thumbnail,
            firstItemName: categoryList.elementAt(index * 2).categoryName,
            // secondItemName: categoryList.elementAt(index * 2 + 1).categoryName,
          );
        } else {
          Goods rightGoods = goodsList.goodsList.firstWhere(
              (element) =>
                  element.category ==
                  categoryList.elementAt(index * 2 + 1).categoryName,
              orElse: () => Goods.createEmptyGoods());

          return CategoryListRow(
            firstImage: leftGoods.id == '' ? null : leftGoods.thumbnail,
            firstItemName: categoryList.elementAt(index * 2).categoryName,
            secondImage: rightGoods.id == '' ? null : rightGoods.thumbnail,
            secondItemName: categoryList.elementAt(index * 2 + 1).categoryName,
          );
        }
      },
    );
  }
}
