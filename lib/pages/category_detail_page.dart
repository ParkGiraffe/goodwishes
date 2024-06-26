import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/goods/category_detail_list.dart';
import 'package:goodwishes/widgets/section_title.dart';

import 'package:provider/provider.dart';

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailPage({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<GoodsListProvider>(context).getCategoryGoods(categoryName);

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
                    CategoryDetailList(serachingList: categoryList),
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
