import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/navigation_tab.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.1),
          ),
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(20),
            left: Radius.circular(20),
          ),
        ),
        height: 75,
        child: const TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          // controller: _tabController,
          tabs: <Widget>[
            NavigationTab(
              icon: Icons.home,
              text: '굿즈',
            ),
            // NavigationTab(
            //   icon: Icons.shopping_bag,
            //   text: '위시',
            // ),
            NavigationTab(
              icon: Icons.add_box,
              text: '추가',
            ),
            NavigationTab(
              icon: Icons.search,
              text: '검색',
            ),
            NavigationTab(
              icon: Icons.star,
              text: '즐겨찾기',
            ),
          ],
        ),
      ),
    );
  }
}
