import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/widgets/wish/wish_detail_list.dart';
import 'package:goodwishes/widgets/wish/wish_detail_thumb.dart';
import 'package:goodwishes/widgets/wish/wish_detail_title.dart';

import 'package:provider/provider.dart';

class WishDetailPage extends StatelessWidget {
  final String id;

  const WishDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Wish wish = context.watch<WishListProvider>().wishList.firstWhere(
        (element) => element.id == id,
        orElse: () => Wish.createEmptyWish());

    if (wish.id.isEmpty) {
      // Handle the case where the wish is not found
      return const Scaffold(
        body: Center(
          child: Text('wish not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              WishDetailThumb(
                wish: wish,
              ),
              WishDetailTitle(
                wish: wish,
              ),
              WishDetailList(
                wish: wish,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
