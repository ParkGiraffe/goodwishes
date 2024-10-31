import 'package:flutter/material.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list_el.dart';

class WishSearchingList extends StatelessWidget {
  final List<Wish> serachingList;

  const WishSearchingList({
    super.key,
    required this.serachingList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 100, top: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
        childAspectRatio: 0.8, // 위젯 출력 비율
        crossAxisSpacing: 10, // 가로 여백
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


// import 'package:flutter/material.dart';
// import 'package:goodwishes/Models/wish_model.dart';
// import 'package:goodwishes/widgets/wish/wish_searching_list_row.dart';

// class WishSearchingList extends StatelessWidget {
//   final List<Wish> serachingList;

//   const WishSearchingList({
//     super.key,
//     required this.serachingList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: (serachingList.length / 2).ceil(),
//       itemBuilder: (context, index) {
//         if (index * 2 + 1 >= serachingList.length) {
//           return WishSearchingListRow(
//             firstItem: serachingList[index * 2],
//           );
//         } else {
//           return WishSearchingListRow(
//             firstItem: serachingList[index * 2],
//             secondItem: serachingList[index * 2 + 1],
//           );
//         }
//       },
//     );
//   }
// }
