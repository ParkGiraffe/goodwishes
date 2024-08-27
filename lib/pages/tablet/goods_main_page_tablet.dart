import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/horizon_list_goods_category.dart';
import 'package:goodwishes/widgets/page_title.dart';
import 'package:goodwishes/widgets/section_title.dart';
// import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/horizon_list_goods.dart';
// import 'package:goodwishes/widgets/goods/category_list.dart';

class GoodsMainPageTablet extends StatelessWidget {
  const GoodsMainPageTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: UIDefault.pageHorizontalPadding,
            ),
            child: PageTitle(
              title: 'GoodsList',
            ),
          ),

          // top
          SizedBox(
            height: UIDefault.sizedBoxHeight,
          ),
          // body
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UIDefault.pageHorizontalPadding,
                ),
                child: SectionTitle(titleText: '최근에 추가된 굿즈들'),
              ),
              SizedBox(
                height: UIDefault.sizedBoxHeight - 5,
              ),
              HorizonListGoods(),
              SizedBox(
                height: UIDefault.sizedBoxHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UIDefault.pageHorizontalPadding,
                ),
                child: SectionTitle(titleText: 'Category'),
              ),
              SizedBox(
                height: UIDefault.sizedBoxHeight - 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UIDefault.pageHorizontalPadding,
                ),
                child: HorizonListGoodsCategory(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
