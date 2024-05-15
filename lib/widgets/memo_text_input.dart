import 'package:flutter/material.dart';

class MemoTextInput extends StatelessWidget {
  const MemoTextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        style: const TextStyle(
          fontSize: 17,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          // contentPadding: const EdgeInsets.only(bottom: 0),
          hintText: '메모를 입력하세요',
        ),
      ),
    );
  }
}
