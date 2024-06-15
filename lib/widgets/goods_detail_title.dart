import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/tag.dart';

class GoodsDetailTitle extends StatelessWidget {
  final Goods goods;

  const GoodsDetailTitle({
    super.key,
    required this.goods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFDBCACA),
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   'categoryName',
                  //   style: TextStyle(
                  //     fontSize: 13,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    goods.goodsName,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    goods.date,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Tag(
                              tagName: goods.category,
                              onNavigate: () {},
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Icon(Icons.bookmark)
            ],
          ),
        ],
      ),
    );
  }
}
