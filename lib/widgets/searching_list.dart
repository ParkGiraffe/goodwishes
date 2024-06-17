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
            firstItem: serachingList[index * 2],
          );
        } else {
          return SearchingListRow(
            firstItem: serachingList[index * 2],
            secondItem: serachingList[index * 2 + 1],
          );
        }
      },
    );
  }
}
