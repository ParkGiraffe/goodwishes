import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/searching_list.dart';

import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Goods> searchingList = [];
  List<String> searchedList = [];

  @override
  Widget build(BuildContext context) {
    final goodsListProvider = Provider.of<GoodsListProvider>(context);

    // String searching = '';

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIDefault.pageHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const StackTopNavigationBar(),
            const TopWithProfile(title: 'Search'),
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
                    searchingList = goodsListProvider.searchGoods(value);
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
            const SectionTitle(
              titleText: '검색된 굿즈',
            ),
            SearchingList(
              serachingList: searchingList,
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
