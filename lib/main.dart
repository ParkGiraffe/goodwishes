import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/pages/add_goods_page.dart';
import 'package:goodwishes/pages/favorite_page.dart';
import 'package:goodwishes/pages/search_page.dart';
// import 'package:goodwishes/pages/wishlist_main_page.dart';
import 'package:goodwishes/widgets/bottom_navigation.dart';
import 'package:goodwishes/pages/goods_main_page.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GoodsAdapter());
  await Hive.openBox<Goods>('GoodsListBox');

  var box = Hive.box<Goods>('GoodsListBox');
  box.toMap().forEach((key, value) {
    print(value);
  });
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
          body: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (BuildContext context) => GoodsListProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => CategoryListProvider(),
              ),
            ],
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
