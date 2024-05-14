import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/horizon_list.dart';
import 'package:goodwishes/widgets/category_list.dart';

class GoodsMainPage extends StatelessWidget {
  const GoodsMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24),
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
                Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: CategoryList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
