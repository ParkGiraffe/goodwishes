import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:provider/provider.dart';

class GoodsDetailTitle extends StatelessWidget {
  final Goods goods;

  const GoodsDetailTitle({
    super.key,
    required this.goods,
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
                    goods.goodsName,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    goods.date,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(
                    height: UIDefault.sizedBoxHeight,
                  ),
                  Tag(
                    tagName: goods.category,
                    // onNavigate: () {},
                  ),
                ],
              ),
              IconButton(
                style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    iconSize: WidgetStatePropertyAll(UIDefault.buttonSize)),
                icon: !goods.isFavorite
                    ? const Icon(Icons.bookmark_add_outlined)
                    : const Icon(Icons.bookmark_added_rounded),
                onPressed: () {
                  Provider.of<GoodsListProvider>(context, listen: false)
                      .updateIsFavorite(goods.id);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
