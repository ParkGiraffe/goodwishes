import 'package:flutter/material.dart';

class CategoryListEl extends StatelessWidget {
  final String imageRoute;
  final String itemName;

  const CategoryListEl({
    super.key,
    required this.imageRoute,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageRoute),
            ),
          ),
        ),
        Text(
          itemName,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
