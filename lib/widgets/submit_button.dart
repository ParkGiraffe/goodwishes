import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          '등록',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
