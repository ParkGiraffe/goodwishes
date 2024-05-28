import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Providers/goods_list.dart';
import 'package:goodwishes/pages/add_goods_page.dart';
import 'package:goodwishes/pages/favorite_page.dart';
import 'package:goodwishes/pages/search_page.dart';
// import 'package:goodwishes/pages/wishlist_main_page.dart';
import 'package:goodwishes/widgets/bottom_navigation.dart';
import 'package:goodwishes/pages/goods_main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 안드로이드 home indicator의 뒷 배경을 검정색에서 원하는 색으로 변경
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: const BottomNavigation(),
          body: ChangeNotifierProvider(
            create: (BuildContext context) => GoodsListProvider(),
            child: const SafeArea(
              child: TabBarView(
                children: [
                  GoodsMainPage(),
                  // WishlistMainPage(),
                  AddGoodsPage(),
                  SearchPage(),
                  FavoritePage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
