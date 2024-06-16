import 'package:flutter/material.dart';
import 'package:goodwishes/pages/category_detail_page.dart';

class Tag extends StatelessWidget {
  Function? onNavigate;
  final String tagName;
  Tag({
    super.key,
    this.onNavigate,
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all<Size>(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        if (onNavigate != null) {
          onNavigate!(context);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailPage(categoryName: tagName),
            ),
          );
        }
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
