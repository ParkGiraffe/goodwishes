import 'package:flutter/material.dart';
import 'package:goodwishes/pages/mobile/add_goods_page.dart';
import 'package:goodwishes/pages/mobile/favorite_page.dart';
import 'package:goodwishes/pages/mobile/goods_main_page.dart';
import 'package:goodwishes/pages/mobile/search_page.dart';
import 'package:goodwishes/pages/mobile/wish_main_page.dart';

class BuildMobileLayout extends StatelessWidget {
  const BuildMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          GoodsMainPage(),
          WishMainPage(),
          AddGoodsPage(),
          SearchPage(),
          FavoritePage(),
        ],
      ),
    );
  }
}
