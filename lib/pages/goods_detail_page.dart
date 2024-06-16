import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/goods_detail_list.dart';
import 'package:goodwishes/widgets/goods_detail_thumb.dart';
import 'package:goodwishes/widgets/goods_detail_title.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';
import 'package:provider/provider.dart';

class GoodsDetailPage extends StatelessWidget {
  final String id;

  const GoodsDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Goods goods = context.watch<GoodsListProvider>().goodsList.firstWhere(
          (element) => element.id == id,
          orElse: () => Goods(
            id: '',
            thumbnail: Uint8List(0),
            goodsName: '',
            date: '',
            category: '',
            location: '',
            wayToBuy: '',
            memo: '',
            amount: 0,
            price: 0,
            tagList: [],
          ),
        );

    if (goods.id.isEmpty) {
      // Handle the case where the goods is not found
      return const Scaffold(
        body: Center(
          child: Text('Goods not found'),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const StackTopNavigationBar(),
              GoodsDetailThumb(
                goods: goods,
              ),
              GoodsDetailTitle(
                goods: goods,
              ),
              GoodsDetailList(
                goods: goods,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
