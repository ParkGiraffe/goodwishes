import 'package:flutter/material.dart';
import 'package:goodwishes/Models/wish_category_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/pages/text_dialog.dart';
import 'package:provider/provider.dart';

class WishDeleteButton extends StatelessWidget {
  final String id;
  final String categoryName;
  const WishDeleteButton({
    super.key,
    required this.id,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Provider.of<WishListProvider>(context, listen: false).removeWish(id);
        Provider.of<WishCategoryListProvider>(context, listen: false)
            .downCountCategory(categoryName);
        if (context.mounted) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return const TextDialog(
                text: '위시가 제거되었습니다.',
              );
            },
          );
        }
      },
      child: Container(
        // width: 84,
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFFDBCACA),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const Center(
          child: Text(
            '삭제',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
