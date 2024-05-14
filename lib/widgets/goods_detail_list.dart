import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list.dart';
import 'package:goodwishes/widgets/goods_detail_list_el.dart';
import 'package:goodwishes/widgets/section_title.dart';

class GoodsDetailList extends StatelessWidget {
  const GoodsDetailList({
    super.key,
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
          const GoodsDetailListEl(
            leftText: '소지 수량',
            rightText: '3장',
          ),
          const GoodsDetailListEl(
            leftText: '구매 가격',
            rightText: '10,000₩ / 개당',
          ),
          const GoodsDetailListEl(
            leftText: '구매 방법',
            rightText: '번개장터',
          ),
          const GoodsDetailListEl(
            leftText: '보관 장소',
            rightText: '카드 바인더',
          ),
          const SizedBox(
            height: 5,
          ),
          const SectionTitle(titleText: '메모'),
          Container(
            height: 240,
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const SectionTitle(titleText: '같은 카테고리의 물건들'),
          const SizedBox(
            height: 15,
          ),
          const CategoryList(),
        ],
      ),
    );
  }
}
