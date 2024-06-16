import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/pages/goods_detail_page.dart';

class HorizonListEl extends StatelessWidget {
  final Uint8List image;
  final String goodsName;
  final String date;
  final String id;

  const HorizonListEl({
    super.key,
    required this.image,
    required this.goodsName,
    required this.date,
    required this.id,
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
            builder: (context) => GoodsDetailPage(id: id),
          ),
        );
      },
      child: Container(
        height: 300,
        width: 250,
        margin: const EdgeInsets.only(left: UIDefault.pageHorizontalPadding),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: MemoryImage(
              image,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 100,
              width: 250,
              decoration: const BoxDecoration(
                color: Color(0xDEDBCACA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    goodsName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(date),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
