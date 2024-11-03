import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/goods/searching_list.dart';

import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isGoods = true;
  List<Goods> searchingList = [];
  List<Wish> searchingListWish = [];

  @override
  Widget build(BuildContext context) {
    void isGoodsChangeHandler() {
      setState(() {
        isGoods = !isGoods;
      });
    }

    final goodsListProvider = Provider.of<GoodsListProvider>(context);
    final wishListProvider = Provider.of<WishListProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIDefault.pageHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopWithProfile(title: 'Search'),
            const SizedBox(
              height: UIDefault.sizedBoxHeight,
            ),
            ChangeGoodsWishButton(
                isGoods: isGoods, onClick: isGoodsChangeHandler),
            const SizedBox(
              height: UIDefault.sizedBoxHeight,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    isGoods
                        ? searchingList = goodsListProvider.searchGoods(value)
                        : searchingListWish =
                            wishListProvider.searchWish(value);
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '검색어를 입력하세요',
                ),
              ),
            ),
            isGoods
                ? const SectionTitle(
                    titleText: '검색된 굿즈',
                  )
                : const SectionTitle(
                    titleText: '검색된 위시',
                  ),
            isGoods
                ? SearchingList(
                    serachingList: searchingList,
                  )
                : WishSearchingList(
                    serachingList: searchingListWish,
                  ),
          ],
        ),
      ),
    );
  }
}

// class SearchedList extends StatelessWidget {
//   final List<String> serachedList;

//   const SearchedList({
//     super.key,
//     required this.serachedList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         SearchedListEl(
//           text: '모코코 키링',
//         ),
//         SearchedListEl(
//           text: '피카츄 인형',
//         ),
//       ],
//     );
//   }
// }

// class SearchedListEl extends StatelessWidget {
//   final String text;
//   const SearchedListEl({
//     super.key,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 17,
//           ),
//         ),
//         const SizedBox(
//           height: 40,
//         ),
//         const Spacer(),
//         const Icon(Icons.close),
//       ],
//     );
//   }
// }
