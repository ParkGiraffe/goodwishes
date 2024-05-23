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
    final goodsList = Provider.of<GoodsListProvider>(context).goodsList;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HorizonListEl(
            imageRoute: goodsList[0].thumbnail,
            goodsName: goodsList[0].goodsName,
            date: goodsList[0].date,
          ),
          const HorizonListEl(
            imageRoute: 'assets/goods.jpeg',
            goodsName: 'GoodsName',
            date: '2024.xx.xx',
          ),
        ],
      ),
    );
  }
}
