import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_list.dart';
import 'package:goodwishes/widgets/horizon_list_el.dart';
import 'package:provider/provider.dart';

class HorizonList extends StatelessWidget {
  const HorizonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // List<Goods> goodsList = Provider.of<GoodsListProvider>(context).goodsList;
    List<Goods> goodsList = context.watch<GoodsListProvider>().goodsList;
    // List<Goods> goodsList = context.select<GoodsListProvider>((state) => state.goodsList);
    print(goodsList);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (Goods goods in goodsList)
            HorizonListEl(
              // imageRoute: 'assets/goods.jpeg',
              imageRoute: goods.thumbnail,
              goodsName: goods.goodsName,
              date: goods.date,
            ),
          // const HorizonListEl(
          //   imageRoute: 'assets/goods.jpeg',
          //   goodsName: 'GoodsName',
          //   date: '2024.xx.xx',
          // ),
        ],
      ),
    );
  }
}
