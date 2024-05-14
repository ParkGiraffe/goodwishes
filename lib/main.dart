import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/bottom_navigation.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/horizon_list.dart';
import 'package:goodwishes/widgets/category_list.dart';

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
