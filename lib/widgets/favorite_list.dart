import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/favorite_list_row.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
