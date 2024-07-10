import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/profile_model.dart';
import 'package:goodwishes/Providers/wish_category_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/pages/add_goods_page.dart';
import 'package:goodwishes/pages/favorite_page.dart';
import 'package:goodwishes/pages/search_page.dart';
import 'package:goodwishes/pages/wish_main_page.dart';
import 'package:goodwishes/widgets/bottom_navigation.dart';
import 'package:goodwishes/pages/goods_main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GoodsAdapter());
  Hive.registerAdapter(WishAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox<Goods>('goodsListBox');
  await Hive.openBox<Wish>('wishListBox');
  await Hive.openBox<Category>('categoryListBox');
  await Hive.openBox<Profile>('profileBox');
  await Hive.openBox<Category>('wishCategoryListBox');

  var categories = Hive.box<Category>('categoryListBox');
  if (categories.get('no_catgory') == null) {
    categories.put('no_category',
        Category(id: 'no_category', categoryName: '카테고리 없음', count: 0));
  }
  var wishCategories = Hive.box<Category>('wishCategoryListBox');
  if (wishCategories.get('no_category') == null) {
    wishCategories.put('no_category',
        Category(id: 'no_category', categoryName: '카테고리 없음', count: 0));
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
        ChangeNotifierProvider(
          create: (BuildContext context) => WishCategoryListProvider(),
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
      // 디버그 표시를 없앤다.
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        animationDuration: Duration.zero,
        length: 5,
        child: Scaffold(
          bottomNavigationBar: BottomNavigation(),
          body: SafeArea(
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
          ),
        ),
      ),
    );
  }
}
