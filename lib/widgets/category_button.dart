import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryButton extends StatelessWidget {
  Function onNavigate;
  final String tagName;
  CategoryButton({
    super.key,
    required this.onNavigate,
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all<Size>(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        onNavigate();
      },
      child: Container(
        // width: 84,
        // margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        // margin: EdgeInsets.zero,
        height: 27,
        decoration: const BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Center(
          child: Text(
            tagName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.5,
            ),
          ),
        ),
      ),
    );
  }
}
