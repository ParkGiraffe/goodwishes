import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 27,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: const Center(
        child: Text(
          'TagName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.5,
          ),
        ),
      ),
    );
  }
}
