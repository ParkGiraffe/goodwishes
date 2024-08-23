import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/wish_category_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/wish/wish_category_list_el.dart';
import 'package:provider/provider.dart';

class HorizonListWishCategory extends StatelessWidget {
  const HorizonListWishCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable<Category> categoryList =
        Provider.of<WishCategoryListProvider>(context).categoryList;
    final wishList = Provider.of<WishListProvider>(context);

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          int curIdx = categoryList.length - index - 1;
          Wish thumbnailGoods = wishList.wishList.firstWhere(
              (element) =>
                  element.category ==
                  categoryList.elementAt(curIdx).categoryName,
              orElse: () => Wish.createEmptyWish());

          return Container(
            margin: EdgeInsets.only(
              left: curIdx == categoryList.length - 1
                  ? 0
                  : UIDefault.pageHorizontalPadding,
            ),
            child: WishCategoryListEl(
              image: thumbnailGoods.thumbnail,
              itemName: categoryList.elementAt(curIdx).categoryName,
            ),
          );
        },
      ),
    );
  }
}
