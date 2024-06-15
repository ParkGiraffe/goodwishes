import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/searching_list_row.dart';

class SearchingList extends StatelessWidget {
  final List<Goods> serachingList;

  const SearchingList({
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
          return SearchingListRow(
            firstImageRoute: serachingList[index * 2].thumbnail,
            firstItemName: serachingList[index * 2].goodsName,
            // secondItemName: serachingList[index * 2 + 1].goodsName,
          );
        } else {
          return SearchingListRow(
            firstImageRoute: serachingList[index * 2].thumbnail,
            firstItemName: serachingList[index * 2].goodsName,
            secondItemName: serachingList[index * 2 + 1].goodsName,
            secondImageRoute: serachingList[index * 2 + 1].thumbnail,
          );
        }
      },
    );
  }
}
