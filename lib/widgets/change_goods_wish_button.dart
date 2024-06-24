import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

class ChangeGoodsWishButton extends StatelessWidget {
  final bool isGoods;
  final Function onClick;

  const ChangeGoodsWishButton({
    super.key,
    required this.isGoods,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoodsButton(
            isGoods: isGoods,
          ),
          WishButton(
            isGoods: isGoods,
          ),
        ],
      ),
    );
  }
}

class GoodsButton extends StatelessWidget {
  final bool isGoods;
  const GoodsButton({
    super.key,
    required this.isGoods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: isGoods ? UIDefault.activeColor : UIDefault.inactiveColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: const Center(
        child: Text(
          'GoodsList',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WishButton extends StatelessWidget {
  final bool isGoods;
  const WishButton({
    super.key,
    required this.isGoods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: isGoods ? UIDefault.inactiveColor : UIDefault.activeColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: const Center(
        child: Text(
          'WishList',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xAA000000),
          ),
        ),
      ),
    );
  }
}
