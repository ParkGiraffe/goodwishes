import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: const BottomNavigation(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // top
                    const TopWithProfile(),
                    const SizedBox(
                      height: 20,
                    ),
                    // body
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '최근에 추가된 굿즈들',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //user list
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 300,
                                  width: 250,
                                  margin: EdgeInsets.only(right: 30),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/goods.jpeg',
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'GoodsName',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('2024.xx.xx'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width: 250,
                                  margin: EdgeInsets.only(right: 30),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/goods.jpeg',
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'GoodsName',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text('2024.xx.xx'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        // feeds
                        Column(
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage('assets/goods.jpeg'),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'CategoryName',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      Text(
                                        'CategoryName',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      Text(
                                        'CategoryName',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      Text(
                                        'CategoryName',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
