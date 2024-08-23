import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/widgets/horizon_list_el.dart';
import 'package:provider/provider.dart';

class HorizonListWish extends StatelessWidget {
  const HorizonListWish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Iterable<Wish> wishList = Provider.of<WishListProvider>(context).wishList;

    // final wishList = context.select((wishListProvider i) => i.wishList);
    // List<wish> wishList = context.select<wishListProvider>((state) => state.wishList);
    // print(wishList);

    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: wishList.length,
        itemBuilder: (context, index) {
          int curIdx = wishList.length - index - 1; // 최신순으로 보게 끔 조정
          return HorizonListEl(
            // imageRoute: 'assets/wish.jpeg',
            image: wishList.elementAt(curIdx).thumbnail,
            goodsName: wishList.elementAt(curIdx).wishName,
            date: wishList.elementAt(curIdx).date,
            id: wishList.elementAt(curIdx).id,
            isGoods: false,
          );
        },
      ),
    );
  }
}
