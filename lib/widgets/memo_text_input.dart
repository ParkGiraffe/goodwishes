import 'package:flutter/material.dart';

class MemoTextInput extends StatelessWidget {
  const MemoTextInput({super.key, required this.onSaved, this.initVal = ''});
  final FormFieldSetter<String> onSaved;
  final String initVal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: TextFormField(
        initialValue: initVal,
        onSaved: onSaved,
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
