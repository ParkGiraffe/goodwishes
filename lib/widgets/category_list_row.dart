import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list_el.dart';

class CategoryListRow extends StatelessWidget {
  final Uint8List? firstImage;
  final String firstItemName;
  final Uint8List? secondImage;
  final String secondItemName;

  const CategoryListRow({
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
                  CategoryListEl(
                    image: firstImage,
                    itemName: firstItemName,
                  ),
                ]
              : [
                  CategoryListEl(
                    image: firstImage,
                    itemName: firstItemName,
                  ),
                  CategoryListEl(
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
