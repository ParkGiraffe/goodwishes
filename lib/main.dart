import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/profile_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/pages/add_goods_page.dart';
import 'package:goodwishes/pages/favorite_page.dart';
import 'package:goodwishes/pages/search_page.dart';
import 'package:goodwishes/pages/wishlist_main_page.dart';
import 'package:goodwishes/widgets/bottom_navigation.dart';
import 'package:goodwishes/pages/goods_main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GoodsAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox<Goods>('GoodsListBox');
  await Hive.openBox<Category>('CategoryListBox');
  await Hive.openBox<Profile>('ProfileBox');

  var categories = Hive.box<Category>('CategoryListBox');
  if (categories.get('default') == null) {
    categories.put(
        'default', Category(id: 'default', categoryName: '일반', count: 0));
  }

  var profile = Hive.box<Profile>('ProfileBox');
  if (profile.get('profile') == null) {
    profile.put('profile', Profile([], true));
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => GoodsListProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoryListProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProfiletProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => WishListProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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

    return const MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: BottomNavigation(),
          body: SafeArea(
            child: TabBarView(
              children: [
                GoodsMainPage(),
                WishMainPage(),
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
