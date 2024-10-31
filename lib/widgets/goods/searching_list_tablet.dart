import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/widgets/goods/searching_list_el.dart';

class SearchingListTablet extends StatelessWidget {
  final List<Goods> serachingList;

  const SearchingListTablet({
    super.key,
    required this.serachingList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 40.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).size.width ~/ 200, // 한 줄에 몇 개의 아이템을 보여줄지 설정
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: serachingList.length,
      itemBuilder: (context, index) {
        return SearchingListEl(
          item: serachingList[index],
        );
      },
    );
  }
}
