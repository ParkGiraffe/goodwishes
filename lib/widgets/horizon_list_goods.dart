import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/widgets/horizon_list_el.dart';
import 'package:provider/provider.dart';

class HorizonListGoods extends StatelessWidget {
  const HorizonListGoods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable<Goods> goodsList =
        Provider.of<GoodsListProvider>(context).goodsList;

    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: goodsList.length,
        itemBuilder: (context, index) {
          int curIdx = goodsList.length - index - 1; // 최신순으로 보게 끔 조정
          return HorizonListEl(
            // imageRoute: 'assets/goods.jpeg',
            image: goodsList.elementAt(curIdx).thumbnail,
            goodsName: goodsList.elementAt(curIdx).goodsName,
            date: goodsList.elementAt(curIdx).date,
            id: goodsList.elementAt(curIdx).id,
          );
        },
      ),
    );
  }
}
