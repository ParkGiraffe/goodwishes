import 'package:flutter/material.dart';

class GoodsDetailListEl extends StatelessWidget {
  final String leftText;
  final String rightText;

  const GoodsDetailListEl({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              leftText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Text(
              rightText,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
