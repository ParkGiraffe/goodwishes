import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/add_goods_list.dart';
// import 'package:goodwishes/widgets/add_photo.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';

class AddGoodsPage extends StatelessWidget {
  const AddGoodsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          StackTopNavigationBar(),
          ChangeGoodsWishButton(),
          SizedBox(
            height: 20,
          ),
          AddGoodsList(),
        ],
      ),
    );
  }
}
