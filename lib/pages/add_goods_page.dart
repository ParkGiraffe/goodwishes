import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/add_goods_list.dart';
import 'package:goodwishes/widgets/goods_detail_thumb.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';

class AddGoodsPage extends StatelessWidget {
  const AddGoodsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          StackTopNavigationBar(),
          GoodsDetailThumb(),
          AddGoodsList(),
        ],
      ),
    );
  }
}
