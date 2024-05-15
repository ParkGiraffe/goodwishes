import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: const TextStyle(
          fontSize: 17,
        ),
        decoration: InputDecoration.collapsed(
          border: const UnderlineInputBorder(),
          // contentPadding: const EdgeInsets.only(bottom: 0),
          hintText: hintText,
        ),
      ),
    );
  }
}
