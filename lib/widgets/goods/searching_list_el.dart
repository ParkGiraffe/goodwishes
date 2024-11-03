import 'package:flutter/material.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/pages/goods_detail_page.dart';

class SearchingListEl extends StatelessWidget {
  final Goods item;

  const SearchingListEl({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoodsDetailPage(id: item.id),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: MemoryImage(item.thumbnail),
              ),
            ),
          ),
          Text(
            item.goodsName,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
