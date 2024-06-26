import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';

import 'package:goodwishes/widgets/goods/searching_list_el.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list_el.dart';

class WishSearchingListRow extends StatelessWidget {
  final Wish firstItem;
  final Wish? secondItem;

  const WishSearchingListRow({
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
                  WishSearchingListEl(
                    item: firstItem,
                  ),
                ]
              : [
                  WishSearchingListEl(
                    item: firstItem,
                  ),
                  WishSearchingListEl(
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
