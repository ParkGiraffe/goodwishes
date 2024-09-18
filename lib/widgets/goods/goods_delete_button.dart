import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:provider/provider.dart';

class GoodsDeleteButton extends StatelessWidget {
  final String id;
  final String categoryName;
  const GoodsDeleteButton({
    super.key,
    required this.id,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Provider.of<GoodsListProvider>(context, listen: false).removeGoods(id);
        Provider.of<CategoryListProvider>(context, listen: false)
            .downCountCategory(categoryName);
        if (context.mounted) {
          Navigator.pop(context);
          showInfoDialog(
            context,
            '알림',
            '굿즈가 제거되었습니다.',
          );
        }
      },
      child: Container(
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
