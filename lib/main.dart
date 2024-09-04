import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodwishes/Layouts/build_mobile_layout.dart';
import 'package:goodwishes/Layouts/build_tablet_layout.dart';
// import 'package:goodwishes/Functions/request_storage_permission.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/Models/wish_category_model.dart';
import 'package:goodwishes/Models/wish_model.dart';

import 'package:goodwishes/widgets/bottom_navigation.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(GoodsAdapter());
  Hive.registerAdapter(WishAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProfileAdapter());

  await _openHiveBoxes();

  var categories = Hive.box<Category>('categoryListBox');
  if (categories.get('no_category') == null) {
    categories.put('no_category',
        Category(id: 'no_category', categoryName: '카테고리 없음', count: 0));
  }
  var wishCategories = Hive.box<Category>('wishCategoryListBox');
  if (wishCategories.get('no_category') == null) {
    wishCategories.put('no_category',
        Category(id: 'no_category', categoryName: '카테고리 없음', count: 0));
  }

  var profile = Hive.box<Profile>('profileBox');
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

Future<void> _openHiveBoxes() async {
  List<Future> futures = [
    Hive.openBox<Goods>('goodsListBox'),
    Hive.openBox<Wish>('wishListBox'),
    Hive.openBox<Category>('categoryListBox'),
    Hive.openBox<Profile>('profileBox'),
    Hive.openBox<Category>('wishCategoryListBox'),
  ];
  await Future.wait(futures);
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

    var isTablet = MediaQuery.of(context).size.width > 600;

    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 표시를 없앤다.
      home: DefaultTabController(
        animationDuration: Duration.zero,
        length: 5,
        child: Scaffold(
          bottomNavigationBar: !isTablet ? const BottomNavigation() : null,
          body:
              isTablet ? const BuildTabletLayout() : const BuildMobileLayout(),
        ),
      ),
    );
  }
}
