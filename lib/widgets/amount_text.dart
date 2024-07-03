import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

class AmountText extends StatelessWidget {
  const AmountText({
    super.key,
    required this.amount,
    required this.text,
  });

  final int amount;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$text : $amount',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: UIDefault.sizedBoxHeight,
        ),
      ],
    );
  }
}
