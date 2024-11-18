import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/widgets/goods/searching_list_el.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<GoodsListProvider>(context).favoriteList;
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 100, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
        childAspectRatio: 0.8, // 위젯 출력 비율
        crossAxisSpacing: 10, // 가로 여백
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        return SearchingListEl(
          item: favoriteList[index],
        );
      },
    );
  }
}
