import 'package:flutter/material.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/wish/wish_category_detail_list.dart';

import 'package:provider/provider.dart';

class WishCategoryDetailPage extends StatelessWidget {
  final String categoryName;

  const WishCategoryDetailPage({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<WishListProvider>(context).getCategoryWish(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: SectionTitle(
          titleText: categoryName,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UIDefault.pageHorizontalPadding,
                ),
                child: Column(
                  children: [
                    // TopWithProfile(title: categoryName),
                    // StackTopNavigationBar(),
                    const SizedBox(
                      height: UIDefault.sizedBoxHeight,
                    ),
                    // ChangeGoodsWishButton(),
                    // SizedBox(
                    //   height: UIDefault.sizedBoxHeight,
                    // ),
                    WishCategoryDetailList(serachingList: categoryList),
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
