import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/widgets/goods/goods_delete_button.dart';
import 'package:goodwishes/widgets/goods/goods_detail_list_el.dart';
import 'package:goodwishes/widgets/goods/goods_rewrite_button.dart';
import 'package:goodwishes/widgets/section_title.dart';

class GoodsDetailList extends StatelessWidget {
  final Goods goods;

  const GoodsDetailList({
    super.key,
    required this.goods,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          GoodsDetailListEl(
            leftText: '소지 수량',
            rightText: goods.amount.toString(),
          ),
          GoodsDetailListEl(
            leftText: '구매 가격',
            rightText: goods.price.toString(),
          ),
          GoodsDetailListEl(
            leftText: '구매 방법',
            rightText: goods.wayToBuy,
          ),
          GoodsDetailListEl(
            leftText: '보관 장소',
            rightText: goods.location,
          ),
          const SizedBox(
            height: 5,
          ),
          const SectionTitle(titleText: '메모'),
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(17),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 228, 228),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Text(goods.memo),
          ),
          const SizedBox(
            height: 30,
          ),
          GoodsRewriteButton(
            goods: goods,
            categoryName: goods.category,
          ),
          const SizedBox(
            height: 15,
          ),
          GoodsDeleteButton(
            id: goods.id,
            categoryName: goods.category,
          ),
        ],
      ),
    );
  }
}
