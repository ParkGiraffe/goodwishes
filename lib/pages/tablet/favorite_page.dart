import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/goods/favorite_list.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/wish/wish_favorite_list.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isGoods = true;

  void isGoodsChangeHandler() {
    setState(() {
      isGoods = !isGoods;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIDefault.pageHorizontalPadding),
            child: Column(
              children: [
                const TopWithProfile(title: 'Favorite'),
                const SizedBox(
                  height: UIDefault.sizedBoxHeight,
                ),
                ChangeGoodsWishButton(
                  isGoods: isGoods,
                  onClick: isGoodsChangeHandler,
                ),
                const SizedBox(
                  height: UIDefault.sizedBoxHeight,
                ),
                isGoods ? const FavoriteList() : const WishFavoriteList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
