import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/widgets/favorite_list_row.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<GoodsListProvider>(context).favoriteList;

    return const Column(
      children: [
        FavoriteListRow(
          leftText: '모코코 키링',
          leftDate: '2000.00.00',
          leftImage: 'assets/goods.jpeg',
          rightText: '모코코 키링',
          rightDate: '2000.00.00',
          rightImage: 'assets/goods.jpeg',
        ),
        FavoriteListRow(
          leftText: '모코코 키링',
          leftDate: '2000.00.00',
          leftImage: 'assets/goods.jpeg',
          rightText: '모코코 키링',
          rightDate: '2000.00.00',
          rightImage: 'assets/goods.jpeg',
        ),
        FavoriteListRow(
          leftText: '모코코 키링',
          leftDate: '2000.00.00',
          leftImage: 'assets/goods.jpeg',
          rightText: '모코코 키링',
          rightDate: '2000.00.00',
          rightImage: 'assets/goods.jpeg',
        ),
      ],
    );
  }
}
