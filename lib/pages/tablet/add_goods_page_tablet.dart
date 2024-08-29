import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
// import 'package:goodwishes/widgets/goods/add_goods_list.dart';
import 'package:goodwishes/widgets/goods/add_goods_list_tablet.dart';
import 'package:goodwishes/widgets/page_title.dart';
// import 'package:goodwishes/widgets/wish/add_wish_list.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
// import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/wish/add_wish_list_tablet.dart';

class AddGoodsPageTablet extends StatefulWidget {
  const AddGoodsPageTablet({
    super.key,
  });

  @override
  State<AddGoodsPageTablet> createState() => _AddGoodsPageTabletState();
}

class _AddGoodsPageTabletState extends State<AddGoodsPageTablet> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIDefault.pageHorizontalPadding),
            child: PageTitle(title: isGoods ? 'Add Goods' : 'Add Wish'),
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
          isGoods ? const AddGoodsListTablet() : const AddWishListTablet(),
        ],
      ),
    );
  }
}
