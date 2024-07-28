import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

class TextDialog extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const TextDialog({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: const SizedBox(
        height: UIDefault.sizedBoxHeight - 20,
      ),
      title: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (onPressed != null)
              onPressed!();
            else
              Navigator.pop(context);
          },
          child: const Center(
            child: Text(
              'OK',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
