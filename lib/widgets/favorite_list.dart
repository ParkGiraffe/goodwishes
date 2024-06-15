import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/favorite_list_row.dart';
import 'package:goodwishes/widgets/searching_list_row.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<GoodsListProvider>(context).favoriteList;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (favoriteList.length / 2).ceil(),
      itemBuilder: (context, index) {
        if (index * 2 + 1 >= favoriteList.length) {
          return SearchingListRow(
            firstItem: favoriteList[index * 2],
            // firstImageRoute: favoriteList[index * 2].thumbnail,
            // firstItemName: favoriteList[index * 2].goodsName,
            // secondItemName: favoriteList[index * 2 + 1].goodsName,
          );
        } else {
          return SearchingListRow(
            firstItem: favoriteList[index * 2],
            secondItem: favoriteList[index * 2 + 1],
            // firstImageRoute: favoriteList[index * 2].thumbnail,
            // firstItemName: favoriteList[index * 2].goodsName,
            // secondItemName: favoriteList[index * 2 + 1].goodsName,
            // secondImageRoute: favoriteList[index * 2 + 1].thumbnail,
          );
        }
      },
    );
/*
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (favoriteList.length / 2).ceil(),
      itemBuilder: (context, index) {
        if (index * 2 + 1 >= favoriteList.length) {
          return FavoriteListRow(
            leftText: favoriteList[index * 2].goodsName,
            leftDate: favoriteList[index * 2].date,
            leftImage: favoriteList[index * 2].thumbnail,
            // rightText: '모코코 키링',
            // rightDate: '2000.00.00',
            // rightImage: 'assets/goods.jpeg',
          );
        } else {
          return FavoriteListRow(
            leftText: favoriteList[index * 2].goodsName,
            leftDate: favoriteList[index * 2].date,
            leftImage: favoriteList[index * 2 + 1].thumbnail,
            rightText: favoriteList[index * 2 + 1].goodsName,
            rightDate: favoriteList[index * 2 + 1].date,
            rightImage: favoriteList[index * 2 + 1].thumbnail,
          );
        }
      },
    );

    // return const Column(
    //   children: [
    //     FavoriteListRow(
    //       leftText: '모코코 키링',
    //       leftDate: '2000.00.00',
    //       leftImage: 'assets/goods.jpeg',
    //       rightText: '모코코 키링',
    //       rightDate: '2000.00.00',
    //       rightImage: 'assets/goods.jpeg',
    //     ),
    //   ],
    // );
    */
  }
}
