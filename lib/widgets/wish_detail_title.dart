import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:provider/provider.dart';

class WishDetailTitle extends StatelessWidget {
  final Wish wish;

  const WishDetailTitle({
    super.key,
    required this.wish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFDBCACA),
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   'categoryName',
                  //   style: TextStyle(
                  //     fontSize: 13,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    wish.wishName,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    wish.date,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(
                    height: UIDefault.sizedBoxHeight,
                  ),
                  Tag(
                    tagName: wish.category,
                    isWish: true,
                    // onNavigate: () {},
                  ),

                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Tag(
                  //             tagName: goods.category,
                  //             onNavigate: () {},
                  //           ),
                  //           const SizedBox(
                  //             width: 7,
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
              IconButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    iconSize: MaterialStatePropertyAll(UIDefault.buttonSize)),
                icon: !wish.isFavorite
                    ? const Icon(Icons.bookmark_add_outlined)
                    : const Icon(Icons.bookmark_added_rounded),
                onPressed: () {
                  Provider.of<WishListProvider>(context, listen: false)
                      .updateIsFavorite(wish.id);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
