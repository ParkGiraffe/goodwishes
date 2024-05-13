import 'package:flutter/material.dart';

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
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // top
                    TopWithProfile(),
                    SizedBox(
                      height: 20,
                    ),
                    // body
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(titleText: '최근에 추가된 굿즈들'),
                        SizedBox(
                          height: 10,
                        ),
                        HorizonList(),
                        SizedBox(
                          height: 20,
                        ),
                        // feeds
                        SectionTitle(titleText: 'Category'),
                        SizedBox(
                          height: 10,
                        ),
                        CategoryList(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 30),
      child: Column(
        children: [
          CategoryListRow(
            firstImageRoute: 'assets/goods.jpeg',
            firstItemName: 'CategoryName',
            secondImageRoute: 'assets/goods.jpeg',
            secondItemName: 'CategoryName',
          ),
        ],
      ),
    );
  }
}

class CategoryListRow extends StatelessWidget {
  final String firstImageRoute;
  final String firstItemName;
  final String secondImageRoute;
  final String secondItemName;

  const CategoryListRow({
    super.key,
    required this.firstImageRoute,
    required this.firstItemName,
    required this.secondImageRoute,
    required this.secondItemName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryListEl(
              imageRoute: firstImageRoute,
              itemName: firstItemName,
            ),
            const SizedBox(
              width: 30,
            ),
            CategoryListEl(
              imageRoute: secondImageRoute,
              itemName: secondItemName,
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}

class CategoryListEl extends StatelessWidget {
  final String imageRoute;
  final String itemName;

  const CategoryListEl({
    super.key,
    required this.imageRoute,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageRoute),
            ),
          ),
        ),
        Text(
          itemName,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class HorizonList extends StatelessWidget {
  const HorizonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HorizonListEl(
            imageRoute: 'assets/goods.jpeg',
            goodsName: 'GoodsName',
            date: '2024.xx.xx',
          ),
          HorizonListEl(
            imageRoute: 'assets/goods.jpeg',
            goodsName: 'GoodsName',
            date: '2024.xx.xx',
          ),
        ],
      ),
    );
  }
}

class HorizonListEl extends StatelessWidget {
  final String imageRoute;
  final String goodsName;
  final String date;

  const HorizonListEl({
    super.key,
    required this.imageRoute,
    required this.goodsName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            imageRoute,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 100,
            width: 250,
            decoration: const BoxDecoration(
              color: Color(0xDEDBCACA),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  goodsName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String titleText;

  const SectionTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.1,
      ),
    );
  }
}

class TopWithProfile extends StatelessWidget {
  const TopWithProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      // padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // page title
          Text(
            'GoodsList',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
            ),
          ),

          // profile icon

          ProfileIcon(profilePicture: 'assets/profile.png'),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          NavigationTab(
            icon: Icons.shopping_bag,
            text: '위시',
          ),
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
    );
  }
}

class NavigationTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const NavigationTab({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(
        icon,
        size: 35,
      ),
      iconMargin: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

@override
class ProfileIcon extends StatelessWidget {
  // final String userName;
  final String profilePicture;

  const ProfileIcon({super.key, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(
        right: 30,
      ),
      padding: const EdgeInsets.all(2.5),
      decoration: const BoxDecoration(
        color: Color(0xFFDBCACA),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(profilePicture),
            ),
          ),
        ),
      ),
    );
  }
}
