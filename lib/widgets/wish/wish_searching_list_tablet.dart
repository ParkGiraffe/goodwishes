import 'package:flutter/material.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list_el.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list_row.dart';

class WishSearchingListTablet extends StatelessWidget {
  final List<Wish> serachingList;

  const WishSearchingListTablet({
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
        // crossAxisSpacing: 16.0, // 가로 간격
        // mainAxisSpacing: 16.0, // 세로 간격
        // childAspectRatio: 3 / 4, // 아이템의 비율 조정 (가로 / 세로)
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: serachingList.length,
      itemBuilder: (context, index) {
        return WishSearchingListEl(
          item: serachingList[index],
        );
      },
    );
  }
}
