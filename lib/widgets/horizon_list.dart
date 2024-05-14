import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/horizon_list_el.dart';

class HorizonList extends StatelessWidget {
  const HorizonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HorizonListEl(
            imageRoute: 'assets/goods.jpeg',
            goodsName: 'GoodsName',
            date: '2024.xx.xx',
          ),
          HorizonListEl(
            imageRoute: 'assets/goods.jpeg',
            goodsName: 'GoodsName',
            date: '2024.xx.xx',
          ),
        ],
      ),
    );
  }
}
