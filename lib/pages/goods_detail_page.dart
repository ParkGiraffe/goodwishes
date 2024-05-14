import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoodsDetailPage extends StatelessWidget {
  const GoodsDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/goods.jpeg'),
              ),
            ),
          ),
          Container(
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
                        Text(
                          'categoryName',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'GoodsName',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '2024.xx.xx',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 84,
                                    height: 27,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'TagName',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    ),
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
                    Icon(Icons.bookmark)
                  ],
                ),
              ],
            ),
          ),
          // 굿즈 디테일 정보들 출력
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 22.0),
            child: Column(
              children: [
                GoodsDetailListEl(
                  leftText: '소지 수량',
                  rightText: '3장',
                ),
                GoodsDetailListEl(
                  leftText: '구매 가격',
                  rightText: '10,000₩ / 개당',
                ),
                GoodsDetailListEl(
                  leftText: '구매 방법',
                  rightText: '번개장터',
                ),
                GoodsDetailListEl(
                  leftText: '보관 장소',
                  rightText: '카드 바인더',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoodsDetailListEl extends StatelessWidget {
  final String leftText;
  final String rightText;

  const GoodsDetailListEl({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              leftText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Text(
              rightText,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
