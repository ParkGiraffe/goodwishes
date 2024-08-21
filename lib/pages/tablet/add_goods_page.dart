import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/goods/add_goods_list.dart';
import 'package:goodwishes/widgets/wish/add_wish_list.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';

class AddGoodsPage extends StatefulWidget {
  const AddGoodsPage({
    super.key,
  });

  @override
  State<AddGoodsPage> createState() => _AddGoodsPageState();
}

class _AddGoodsPageState extends State<AddGoodsPage> {
  bool isGoods = true;
  @override
  Widget build(BuildContext context) {
    void isGoodsChangeHandler() {
      setState(() {
        isGoods = !isGoods;
      });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIDefault.pageHorizontalPadding),
            child: TopWithProfile(title: isGoods ? 'Add Goods' : 'Add Wish'),
          ),
          const SizedBox(
            height: UIDefault.sizedBoxHeight,
          ),
          ChangeGoodsWishButton(
            isGoods: isGoods,
            onClick: isGoodsChangeHandler,
          ),
          const SizedBox(
            height: UIDefault.sizedBoxHeight,
          ),
          isGoods ? const AddGoodsList() : const AddWishList(),
        ],
      ),
    );
  }
}
