import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/widgets/goods/rewrite_goods_list.dart';

class GoodsRewritePage extends StatelessWidget {
  final Goods goods;

  const GoodsRewritePage({
    super.key,
    required this.goods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              RewriteGoodsList(goods: goods),
            ],
          ),
        ),
      ),
    );
  }
}
