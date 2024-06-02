import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final Function onNavigate;
  final String tagName;
  const Tag({
    super.key,
    required this.onNavigate,
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: () {
        onNavigate(context);
      },
      child: Container(
        // width: 84,
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
