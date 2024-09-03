import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/widgets/goods/searching_list_el.dart';
import 'package:provider/provider.dart';

class FavoriteListTablet extends StatelessWidget {
  const FavoriteListTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<GoodsListProvider>(context).favoriteList;
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 40.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).size.width ~/ 200, // 한 줄에 몇 개의 아이템을 보여줄지 설정
        // crossAxisSpacing: 16.0, // 가로 간격
        // mainAxisSpacing: 16.0, // 세로 간격
        // childAspectRatio: 3 / 4, // 아이템의 비율 조정 (가로 / 세로)
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
/*
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (favoriteList.length / 2).ceil(),
      itemBuilder: (context, index) {
        if (index * 2 + 1 >= favoriteList.length) {
          return FavoriteListTabletRow(
            leftText: favoriteList[index * 2].goodsName,
            leftDate: favoriteList[index * 2].date,
            leftImage: favoriteList[index * 2].thumbnail,
            // rightText: '모코코 키링',
            // rightDate: '2000.00.00',
            // rightImage: 'assets/goods.jpeg',
          );
        } else {
          return FavoriteListTabletRow(
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
    //     FavoriteListTabletRow(
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
  
