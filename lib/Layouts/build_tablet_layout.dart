import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/navigation_rail_button.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
// import 'package:goodwishes/pages/mobile/add_goods_page.dart';
// import 'package:goodwishes/pages/mobile/favorite_page.dart';
// import 'package:goodwishes/pages/mobile/search_page.dart';
import 'package:goodwishes/pages/profile_page.dart';
import 'package:goodwishes/pages/tablet/add_goods_page_tablet.dart';
import 'package:goodwishes/pages/tablet/favorite_page_tablet.dart';
import 'package:goodwishes/pages/tablet/goods_main_page_tablet.dart';
import 'package:goodwishes/pages/tablet/search_page_tablet.dart';
import 'package:goodwishes/pages/tablet/wish_main_page_tablet.dart';
import 'package:goodwishes/widgets/profile_icon.dart';
import 'package:provider/provider.dart';

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
    const AddGoodsPageTablet(),
    const SearchPageTablet(),
    const FavoritePageTablet(),
  ];

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfiletProvider>(context);

    void profileClickHandler() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
    }

    return SafeArea(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            minWidth: 95, // 기본값이 72. 이 값을 조정해서 간격 조정

            leading: Column(
              children: [
                ProfileIcon(
                  profile: profileProvider.profile,
                  onClick: profileClickHandler,
                ),
                const SizedBox(
                  height: UIDefault.sizedBoxHeight,
                )
              ],
            ),
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
