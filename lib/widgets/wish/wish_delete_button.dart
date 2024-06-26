import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:provider/provider.dart';

class WishDeleteButton extends StatelessWidget {
  final String id;
  const WishDeleteButton({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        Provider.of<WishListProvider>(context, listen: false).removeWish(id);
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
