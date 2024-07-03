import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/wish/wish_delete_button.dart';
import 'package:goodwishes/widgets/wish/wish_detail_list_el.dart';

class WishDetailList extends StatelessWidget {
  final Wish wish;

  const WishDetailList({
    super.key,
    required this.wish,
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
          WishDetailListEl(
            leftText: '소지 수량',
            rightText: wish.amount.toString(),
          ),
          WishDetailListEl(
            leftText: '희망 가격',
            rightText: wish.wishPrice.toString(),
          ),
          WishDetailListEl(
            leftText: '최저 가격',
            rightText: wish.rowPrice.toString(),
          ),
          WishDetailListEl(
            leftText: '발견 장소',
            rightText: wish.location,
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
            child: Text(wish.memo),
          ),
          const SizedBox(
            height: 30,
          ),
          // const SectionTitle(titleText: '같은 카테고리의 물건들'),
          // const SizedBox(
          //   height: 15,
          // ),
          // const CategoryList(),
          WishDeleteButton(
            id: wish.id,
            categoryName: wish.category,
          ),
        ],
      ),
    );
  }
}
