import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/add_goods_list.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';

class AddGoodsPage extends StatelessWidget {
  const AddGoodsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: UIDefault.pageHorizontalPadding),
            child: TopWithProfile(title: 'Add Goods'),
          ),
          SizedBox(
            height: UIDefault.sizedBoxHeight,
          ),
          // ChangeGoodsWishButton(),
          SizedBox(
            height: UIDefault.sizedBoxHeight,
          ),
          AddGoodsList(),
        ],
      ),
    );
  }
}
