import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/pages/text_dialog.dart';
import 'package:provider/provider.dart';

class GoodsRewriteButton extends StatelessWidget {
  final String id;
  final String categoryName;
  const GoodsRewriteButton({
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
        Provider.of<GoodsListProvider>(context, listen: false).removeGoods(id);
        Provider.of<CategoryListProvider>(context, listen: false)
            .downCountCategory(categoryName);
        if (context.mounted) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return const TextDialog(
                text: '굿즈가 제거되었습니다.',
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
          color: Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const Center(
          child: Text(
            '수정',
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
