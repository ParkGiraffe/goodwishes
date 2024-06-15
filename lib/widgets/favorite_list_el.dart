import 'dart:typed_data';

import 'package:flutter/material.dart';

class FavoriteListEl extends StatelessWidget {
  final String text;
  final String date;
  final Uint8List image;

  const FavoriteListEl({
    super.key,
    required this.text,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: 160,
            decoration: const BoxDecoration(
              color: Color(0xDEDBCACA),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
