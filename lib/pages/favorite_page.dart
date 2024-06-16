import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/favorite_list.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
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
            child: Column(
              children: [
                TopWithProfile(title: 'Favorite'),
                SizedBox(
                  height: UIDefault.sizedBoxHeight,
                ),
                // ChangeGoodsWishButton(),
                SizedBox(
                  height: UIDefault.sizedBoxHeight,
                ),
                FavoriteList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
