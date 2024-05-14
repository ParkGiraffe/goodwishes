import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/category_list.dart';
import 'package:goodwishes/widgets/goods_detail_list_el.dart';
import 'package:goodwishes/widgets/section_title.dart';

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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
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
                SizedBox(
                  height: 5,
                ),
                SectionTitle(titleText: '메모'),
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SectionTitle(titleText: '같은 카테고리의 물건들'),
                SizedBox(
                  height: 15,
                ),
                CategoryList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
