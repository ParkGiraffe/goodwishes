import 'package:flutter/material.dart';
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
          bottomNavigationBar: SafeArea(
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
                  Tab(
                    icon: Icon(
                      Icons.home,
                      size: 35,
                    ),
                    child: Text(
                      '굿즈',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.shopping_bag,
                      size: 35,
                    ),
                    child: Text(
                      '위시',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    child: Text(
                      '추가',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.search,
                      size: 35,
                    ),
                    child: Text(
                      '검색',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.star,
                      size: 35,
                    ),
                    child: Text(
                      '즐겨찾기',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              //status bar
              const SizedBox(
                height: 44,
              ),
              // top
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // logo
                    Image.asset("assets/Instagram_logo.png"),

                    // icons
                    Row(
                      children: [
                        Image.asset(
                          "assets/Add.png",
                          width: 26,
                          height: 26,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          "assets/Heart.png",
                          width: 26,
                          height: 26,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Image.asset(
                          "assets/Share.png",
                          width: 26,
                          height: 26,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // body
              Expanded(
                child: Column(
                  children: [
                    //user list
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      height: 108,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            // user
                            User(
                              userName: 'flutter_framework',
                              profilePicture: 'assets/Profile_picture_02.png',
                            ),
                            User(
                              userName: 'awesome_application',
                              profilePicture: 'assets/Profile_picture_06.png',
                            ),
                            User(
                              userName: 'flutter_framework',
                              profilePicture: 'assets/Profile_picture_02.png',
                            ),
                            User(
                              userName: 'awesome_application',
                              profilePicture: 'assets/Profile_picture_06.png',
                            ),
                            User(
                              userName: 'flutter_framework',
                              profilePicture: 'assets/Profile_picture_02.png',
                            ),
                            User(
                              userName: 'awesome_application',
                              profilePicture: 'assets/Profile_picture_06.png',
                            ),
                          ],
                        ),
                      ),
                    ),

                    // feeds
                    Column(
                      children: [
                        // user info
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 52,
                          child: Row(
                            children: [
                              Image.asset('assets/Profile_picture_02.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'flutter_framework',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.more_horiz,
                              ),
                            ],
                          ),
                        ),

                        // feed pictures
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Feed_picture_01.png',
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // context는 최상위 부모 위젯에서 생성되는데, 모바일 화면의 온갖 정보를 담고 있는 객체이다.
                              ),
                              Image.asset(
                                'assets/Feed_picture_02.png',
                                width: MediaQuery.of(context).size.width,
                              ),
                              Image.asset(
                                'assets/Feed_picture_03.png',
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                        ),

                        // actions
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          height: 42,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Heart.png',
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/Comment.png',
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/Share.png',
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/Bookmark.png',
                              ),
                            ],
                          ),
                        ),

                        // Details
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@override
class User extends StatelessWidget {
  final String userName;
  final String profilePicture;

  const User({super.key, required this.userName, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 71,
            height: 71,
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
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(profilePicture),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 71,
            child: Text(
              userName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
