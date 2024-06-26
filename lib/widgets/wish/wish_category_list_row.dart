import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/goods/category_list_el.dart';
import 'package:goodwishes/widgets/wish/wish_category_list_el.dart';

class WishCategoryListRow extends StatelessWidget {
  final Uint8List? firstImage;
  final String firstItemName;
  final Uint8List? secondImage;
  final String secondItemName;

  const WishCategoryListRow({
    super.key,
    required this.firstImage,
    required this.firstItemName,
    this.secondImage,
    this.secondItemName = '',
    // String secondImage = '',
    // String secondItemName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: secondImage == null && secondItemName == ''
              ? [
                  WishCategoryListEl(
                    image: firstImage,
                    itemName: firstItemName,
                  ),
                ]
              : [
                  WishCategoryListEl(
                    image: firstImage,
                    itemName: firstItemName,
                  ),
                  WishCategoryListEl(
                    image: secondImage,
                    itemName: secondItemName,
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
