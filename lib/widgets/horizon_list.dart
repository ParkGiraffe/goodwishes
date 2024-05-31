import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/horizon_list_el.dart';
import 'package:provider/provider.dart';

class HorizonList extends StatelessWidget {
  const HorizonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Goods> goodsList = Provider.of<GoodsListProvider>(context).goodsList;
    // final goodsList = context.select((GoodsListProvider i) => i.goodsList);
    // List<Goods> goodsList = context.select<GoodsListProvider>((state) => state.goodsList);
    print(goodsList);

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: goodsList.length,
        itemBuilder: (context, index) {
          return HorizonListEl(
            // imageRoute: 'assets/goods.jpeg',
            imageRoute: goodsList[index].thumbnail,
            goodsName: goodsList[index].goodsName,
            date: goodsList[index].date,
          );
        },
      ),
    );
  }
}
