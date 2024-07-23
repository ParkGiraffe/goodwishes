import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/goods/add_goods_list.dart';
import 'package:goodwishes/widgets/goods/rewrite_goods_list.dart';

class GoodsRewritePage extends StatelessWidget {
  final String id;

  const GoodsRewritePage({
    super.key,
    required this.id,
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
              RewriteGoodsList(id: id),
            ],
          ),
        ),
      ),
    );
  }
}
