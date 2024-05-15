import 'package:flutter/material.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
      ),
      child: const Center(
        child: Text(
          '사진 추가하기',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
