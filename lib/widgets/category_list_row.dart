import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list_el.dart';

class CategoryListRow extends StatelessWidget {
  final Uint8List firstImageRoute;
  final String firstItemName;
  final Uint8List? secondImageRoute;
  final String secondItemName;

  const CategoryListRow({
    super.key,
    required this.firstImageRoute,
    required this.firstItemName,
    this.secondImageRoute,
    this.secondItemName = '',
    // String secondImageRoute = '',
    // String secondItemName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: secondImageRoute == null && secondItemName == ''
              ? [
                  CategoryListEl(
                    imageRoute: firstImageRoute,
                    itemName: firstItemName,
                  ),
                ]
              : [
                  CategoryListEl(
                    imageRoute: firstImageRoute,
                    itemName: firstItemName,
                  ),
                  CategoryListEl(
                    imageRoute: secondImageRoute!,
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
