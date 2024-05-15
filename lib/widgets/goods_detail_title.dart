import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/tag.dart';

class GoodsDetailTitle extends StatelessWidget {
  const GoodsDetailTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
                  const Text(
                    'categoryName',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'GoodsName',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    '2024.xx.xx',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Tag(),
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
