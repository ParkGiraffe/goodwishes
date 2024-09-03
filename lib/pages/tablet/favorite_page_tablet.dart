import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/goods/favorite_list_tablet.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/wish/wish_favorite_list.dart';

class FavoritePageTablet extends StatefulWidget {
  const FavoritePageTablet({
    super.key,
  });

  @override
  State<FavoritePageTablet> createState() => _FavoritePageTabletState();
}

class _FavoritePageTabletState extends State<FavoritePageTablet> {
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
                isGoods ? const FavoriteListTablet() : const WishFavoriteList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
