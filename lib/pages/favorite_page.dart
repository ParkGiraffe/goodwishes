import 'package:flutter/material.dart';
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
            padding: EdgeInsets.only(left: 24),
            child: TopWithProfile(title: 'Bookmark'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ChangeGoodsWishButton(),
                SizedBox(
                  height: 20,
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
