import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/add_goods_list.dart';
import 'package:goodwishes/widgets/add_photo.dart';
import 'package:goodwishes/widgets/change_goods_wish_button.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/stack_top_navigation_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const StackTopNavigationBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: TextFormField(
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
                SectionTitle(
                  titleText: '최근 검색어',
                ),
                SearchedList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchedList extends StatelessWidget {
  const SearchedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchedListEl(
          text: '모코코 키링',
        ),
        SearchedListEl(
          text: '피카츄 인형',
        ),
      ],
    );
  }
}

class SearchedListEl extends StatelessWidget {
  final String text;
  const SearchedListEl({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Spacer(),
        const Icon(Icons.close),
      ],
    );
  }
}
