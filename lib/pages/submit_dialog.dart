import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

class SubmitDialog extends StatelessWidget {
  const SubmitDialog({
    super.key,
  });

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
      title: const Center(
        child: Text(
          '등록되었습니다',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text(
              '완료',
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
