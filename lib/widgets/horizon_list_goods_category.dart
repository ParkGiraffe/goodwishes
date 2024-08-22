import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/goods/category_list_el.dart';
import 'package:goodwishes/widgets/horizon_list_el.dart';
import 'package:provider/provider.dart';

class HorizonListGoodsCategory extends StatelessWidget {
  const HorizonListGoodsCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable<Category> categoryList =
        Provider.of<CategoryListProvider>(context).categoryList;
    final goodsList = Provider.of<GoodsListProvider>(context);

    // final goodsList = context.select((GoodsListProvider i) => i.goodsList);
    // List<Goods> goodsList = context.select<GoodsListProvider>((state) => state.goodsList);
    // print(goodsList);

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          int curIdx = categoryList.length - index - 1;
          Goods thumbnailGoods = goodsList.goodsList.firstWhere(
              (element) =>
                  element.category ==
                  categoryList.elementAt(curIdx).categoryName,
              orElse: () => Goods.createEmptyGoods());

          return Container(
            margin: EdgeInsets.only(
              left: curIdx == categoryList.length - 1
                  ? 0
                  : UIDefault.pageHorizontalPadding,
            ),
            child: CategoryListEl(
              image: thumbnailGoods.thumbnail,
              itemName: categoryList.elementAt(curIdx).categoryName,
            ),
          );

          // return HorizonListEl(
          //   // imageRoute: 'assets/goods.jpeg',
          //   image: goodsList.elementAt(curIdx).thumbnail,
          //   goodsName: goodsList.elementAt(curIdx).goodsName,
          //   date: goodsList.elementAt(curIdx).date,
          //   id: goodsList.elementAt(curIdx).id,
          // );
        },
      ),
    );
  }
}
