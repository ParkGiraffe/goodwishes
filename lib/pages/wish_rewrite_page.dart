import 'package:flutter/material.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/widgets/goods/rewrite_goods_list.dart';
import 'package:goodwishes/widgets/wish/rewrite_wish_list.dart';

class WishRewritePage extends StatelessWidget {
  final Wish wish;

  const WishRewritePage({
    super.key,
    required this.wish,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              RewriteWishList(wish: wish),
            ],
          ),
        ),
      ),
    );
  }
}
