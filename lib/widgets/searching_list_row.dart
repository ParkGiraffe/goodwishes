import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list_el.dart';
import 'package:goodwishes/widgets/searching_list_el.dart';

class SearchingListRow extends StatelessWidget {
  final Uint8List firstImageRoute;
  final String firstItemName;
  final Uint8List? secondImageRoute;
  final String secondItemName;

  const SearchingListRow({
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
                  SearchingListEl(
                    imageRoute: firstImageRoute,
                    itemName: firstItemName,
                  ),
                ]
              : [
                  SearchingListEl(
                    imageRoute: firstImageRoute,
                    itemName: firstItemName,
                  ),
                  SearchingListEl(
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
