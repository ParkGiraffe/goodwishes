import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  final String id;
  const DeleteButton({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Provider.of<GoodsListProvider>(context, listen: false).removeGoods(id);
        if (context.mounted) {
          Navigator.pop(context);
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
