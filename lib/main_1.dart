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
  if (categories.get('default') == null) {
    categories.put(
        'default', Category(id: 'default', categoryName: '일반', count: 0));
  }
  var wishCategories = Hive.box<Category>('wishCategoryListBox');
  if (wishCategories.get('default') == null) {
    wishCategories.put(
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

    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const GoodsMainPage(),
    const WishMainPage(),
    const AddGoodsPage(),
    const SearchPage(),
    const FavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Goods',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Wish',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Goods',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
