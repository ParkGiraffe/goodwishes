import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String titleText;

  const SectionTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.1,
      ),
    );
  }
}
