import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/goods/searching_list.dart';
import 'package:goodwishes/widgets/goods/searching_list_tablet.dart';

import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/wish/wish_searching_list.dart';
import 'package:provider/provider.dart';

class SearchPageTablet extends StatefulWidget {
  const SearchPageTablet({
    super.key,
  });

  @override
  State<SearchPageTablet> createState() => _SearchPageTabletState();
}

class _SearchPageTabletState extends State<SearchPageTablet> {
  bool isGoods = true;
  List<Goods> searchingList = [];
  List<Wish> searchingListWish = [];
  // List<String> searchedList = [];

  @override
  Widget build(BuildContext context) {
    void isGoodsChangeHandler() {
      setState(() {
        isGoods = !isGoods;
      });
    }

    final goodsListProvider = Provider.of<GoodsListProvider>(context);
    final wishListProvider = Provider.of<WishListProvider>(context);

    // String searching = '';

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIDefault.pageHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const StackTopNavigationBar(),
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
                    // searching = value;
                    isGoods
                        ? searchingList = goodsListProvider.searchGoods(value)
                        : searchingListWish =
                            wishListProvider.searchWish(value);
                  });
                  // print(searchingList);
                },
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // contentPadding: const EdgeInsets.only(bottom: 0),
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
                ? SearchingListTablet(
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
