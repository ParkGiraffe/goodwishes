import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'dart:typed_data';

import 'package:goodwishes/pages/category_detail_page.dart';
// import 'dart:core';

class CategoryListEl extends StatelessWidget {
  final Uint8List? image;
  final String itemName;

  const CategoryListEl({
    super.key,
    required this.image,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailPage(categoryName: itemName),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: image != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      // image: AssetImage('assets/goods.jpeg'),
                      image: MemoryImage(image!),
                    )
                  : const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(UIDefault.defaultBackgroundImageRoute),
                      // image: MemoryImage(image!),
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
      ),
    );
  }
}
