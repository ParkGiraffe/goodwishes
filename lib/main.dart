import 'package:flutter/material.dart';
import 'package:goodwishes/pages/add_goods_page.dart';
import 'package:goodwishes/pages/favorite_page.dart';
import 'package:goodwishes/pages/search_page.dart';
import 'package:goodwishes/pages/wishlist_main_page.dart';
import 'package:goodwishes/widgets/bottom_navigation.dart';
import 'package:goodwishes/pages/goods_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: BottomNavigation(),
          body: SafeArea(
            child: TabBarView(
              children: [
                GoodsMainPage(),
                WishlistMainPage(),
                AddGoodsPage(),
                SearchPage(),
                FavoritePage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
