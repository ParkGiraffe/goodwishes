import 'package:flutter/material.dart';

import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/pages/goods_rewrite_page.dart';

class GoodsRewriteButton extends StatelessWidget {
  final Goods goods;
  final String categoryName;
  const GoodsRewriteButton({
    super.key,
    required this.goods,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoodsRewritePage(goods: goods),
          ),
        );
      },
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const Center(
          child: Text(
            '수정',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
