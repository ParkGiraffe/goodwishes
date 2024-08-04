import 'package:flutter/material.dart';

Future<void> showInfoDialog(
  BuildContext context,
  String title,
  String message, {
  Function? onPressed,
  bool? onCancled,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: onCancled != null
            ? <Widget>[
                TextButton(
                  child: const Text(
                    '취소',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    if (onPressed != null) {
                      await onPressed();
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ]
            : <Widget>[
                TextButton(
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (onPressed != null) {
                      onPressed();
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
      );
    },
  );
}
