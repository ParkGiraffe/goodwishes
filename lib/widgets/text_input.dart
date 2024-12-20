import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.onSaved,
    this.initVal = '',
  });

  final FormFieldSetter<String> onSaved;
  final String hintText;
  final TextInputType keyboardType;
  final dynamic initVal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          return null;
        },
        initialValue: initVal,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        style: const TextStyle(
          fontSize: 17,
        ),
        decoration: InputDecoration.collapsed(
          border: const UnderlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
