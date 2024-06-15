import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';

class GoodsDetailThumb extends StatelessWidget {
  final Goods goods;

  const GoodsDetailThumb({
    super.key,
    required this.goods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(goods.thumbnail),
        ),
      ),
    );
  }
}
