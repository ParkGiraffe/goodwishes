import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/widgets/goods/searching_list_row.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list_row.dart';

class WishCategoryDetailList extends StatelessWidget {
  final List<Wish> serachingList;

  const WishCategoryDetailList({
    super.key,
    required this.serachingList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (serachingList.length / 2).ceil(),
      itemBuilder: (context, index) {
        if (index * 2 + 1 >= serachingList.length) {
          return WishSearchingListRow(
            firstItem: serachingList[index * 2],
            // firstImageRoute: serachingList[index * 2].thumbnail,
            // firstItemName: serachingList[index * 2].goodsName,
            // secondItemName: serachingList[index * 2 + 1].goodsName,
          );
        } else {
          return WishSearchingListRow(
            firstItem: serachingList[index * 2],
            secondItem: serachingList[index * 2 + 1],
            // firstImageRoute: serachingList[index * 2].thumbnail,
            // firstItemName: serachingList[index * 2].goodsName,
            // secondItemName: serachingList[index * 2 + 1].goodsName,
            // secondImageRoute: serachingList[index * 2 + 1].thumbnail,
          );
        }
      },
    );
  }
}
