import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        keyboardType: keyboardType,
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
