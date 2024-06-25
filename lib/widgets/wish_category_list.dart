import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/wish_category_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/widgets/category_list_row.dart';
import 'package:goodwishes/widgets/wish_category_list_row.dart';
import 'package:provider/provider.dart';

class WishCategoryList extends StatelessWidget {
  const WishCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<WishCategoryListProvider>(context).categoryList;
    final wishList = Provider.of<WishListProvider>(context);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (categoryList.length / 2).ceil(),
      itemBuilder: (context, index) {
        Wish leftWish = wishList.wishList.firstWhere(
            (element) =>
                element.category ==
                categoryList.elementAt(index * 2).categoryName,
            orElse: () => Wish.createEmptyWish());

        if (index * 2 + 1 >= categoryList.length) {
          return WishCategoryListRow(
            firstImage: leftWish.id == '' ? null : leftWish.thumbnail,
            firstItemName: categoryList.elementAt(index * 2).categoryName,
            // secondItemName: categoryList.elementAt(index * 2 + 1).categoryName,
          );
        } else {
          Wish rightWish = wishList.wishList.firstWhere(
              (element) =>
                  element.category ==
                  categoryList.elementAt(index * 2 + 1).categoryName,
              orElse: () => Wish.createEmptyWish());

          return WishCategoryListRow(
            firstImage: leftWish.id == '' ? null : leftWish.thumbnail,
            firstItemName: categoryList.elementAt(index * 2).categoryName,
            secondImage: rightWish.id == '' ? null : rightWish.thumbnail,
            secondItemName: categoryList.elementAt(index * 2 + 1).categoryName,
          );
        }
      },
    );
  }
}
