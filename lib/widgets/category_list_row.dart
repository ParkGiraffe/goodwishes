import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list_el.dart';

class CategoryListRow extends StatelessWidget {
  final String firstImageRoute;
  final String firstItemName;
  final String secondImageRoute;
  final String secondItemName;

  const CategoryListRow({
    super.key,
    required this.firstImageRoute,
    required this.firstItemName,
    required this.secondImageRoute,
    required this.secondItemName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryListEl(
              imageRoute: firstImageRoute,
              itemName: firstItemName,
            ),
            CategoryListEl(
              imageRoute: secondImageRoute,
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
