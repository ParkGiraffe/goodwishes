import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/goods_detail_list.dart';
import 'package:goodwishes/widgets/goods_detail_thumb.dart';
import 'package:goodwishes/widgets/goods_detail_title.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';

class GoodsDetailPage extends StatelessWidget {
  const GoodsDetailPage({
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
          GoodsDetailTitle(),
          GoodsDetailList(),
        ],
      ),
    );
  }
}
