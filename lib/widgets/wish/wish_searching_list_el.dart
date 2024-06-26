import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/pages/goods_detail_page.dart';
import 'package:goodwishes/pages/wish_detail_page.dart';

class WishSearchingListEl extends StatelessWidget {
  // final Uint8List imageRoute;
  // final String itemName;
  final Wish item;

  const WishSearchingListEl({
    super.key,
    required this.item,

    // required this.imageRoute,
    // required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WishDetailPage(id: item.id),
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
            item.wishName,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
