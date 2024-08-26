import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/navigation_rail_button.dart';
import 'package:goodwishes/pages/mobile/add_goods_page.dart';
import 'package:goodwishes/pages/mobile/favorite_page.dart';
import 'package:goodwishes/pages/mobile/search_page.dart';
import 'package:goodwishes/pages/tablet/goods_main_page_tablet.dart';
import 'package:goodwishes/pages/tablet/wish_main_page_tablet.dart';

class BuildTabletLayout extends StatefulWidget {
  const BuildTabletLayout({super.key});

  @override
  State<BuildTabletLayout> createState() => BuildTabletLayoutState();
}

class BuildTabletLayoutState extends State<BuildTabletLayout> {
  int _selectedIndex = 0;

  // 각 인덱스에 해당하는 페이지를 저장하는 리스트
  final List<Widget> _pages = [
    const GoodsMainPageTablet(),
    const WishMainPageTablet(),
    const AddGoodsPage(),
    const SearchPage(),
    const FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              navigationRailButton(
                '굿즈',
                Icons.home_outlined,
                Icons.home,
              ),
              navigationRailButton(
                '위시',
                Icons.shopping_bag_outlined,
                Icons.shopping_bag_rounded,
              ),
              navigationRailButton(
                '추가',
                Icons.add_box_outlined,
                Icons.add_box_rounded,
              ),
              navigationRailButton(
                '검색',
                Icons.search,
                Icons.search,
              ),
              navigationRailButton(
                '즐겨찾기',
                Icons.star_rate_outlined,
                Icons.star_rate,
              ),
            ],
          ),
          // 선택된 페이지
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
