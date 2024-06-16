import 'package:flutter/material.dart';

class ChangeGoodsWishButton extends StatelessWidget {
  const ChangeGoodsWishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GoodsButton(),
        WishButton(),
      ],
    );
  }
}

class GoodsButton extends StatelessWidget {
  const GoodsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: const BoxDecoration(
        color: Color(0xFFDBCACA),
        borderRadius: BorderRadius.only(
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
  const WishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: const BoxDecoration(
        color: Color(0xAADBCACA),
        borderRadius: BorderRadius.only(
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
