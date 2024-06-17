import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';

import 'package:goodwishes/widgets/searching_list_el.dart';

class SearchingListRow extends StatelessWidget {
  final Goods firstItem;
  final Goods? secondItem;

  const SearchingListRow({
    super.key,
    required this.firstItem,
    this.secondItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: secondItem == null
              ? [
                  SearchingListEl(
                    item: firstItem,
                  ),
                ]
              : [
                  SearchingListEl(
                    item: firstItem,
                  ),
                  SearchingListEl(
                    item: secondItem!,
                  ),
                ],
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
