import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

import 'package:goodwishes/widgets/horizon_list_wish.dart';
import 'package:goodwishes/widgets/horizon_list_wish_category.dart';
import 'package:goodwishes/widgets/page_title.dart';
import 'package:goodwishes/widgets/section_title.dart';

class WishMainPageTablet extends StatelessWidget {
  const WishMainPageTablet({
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
              title: 'WishList',
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
                child: SectionTitle(titleText: '최근에 추가된 위시들'),
              ),
              SizedBox(
                height: UIDefault.sizedBoxHeight - 5,
              ),
              HorizonListWish(),
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
                child: HorizonListWishCategory(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
