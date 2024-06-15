import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/favorite_list_el.dart';

class FavoriteListRow extends StatelessWidget {
  final String leftText;
  final Uint8List leftImage;
  final String leftDate;
  final String rightText;
  final Uint8List? rightImage;
  final String rightDate;

  const FavoriteListRow({
    super.key,
    required this.leftText,
    required this.leftImage,
    required this.leftDate,
    this.rightText = '',
    this.rightImage,
    this.rightDate = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rightDate == '' && rightImage != null && rightText == ''
              ? [
                  FavoriteListEl(
                    text: leftText,
                    date: leftDate,
                    image: leftImage,
                  ),
                ]
              : [
                  FavoriteListEl(
                    text: leftText,
                    date: leftDate,
                    image: leftImage,
                  ),
                  FavoriteListEl(
                    text: rightText,
                    date: rightDate,
                    image: rightImage!,
                  ),
                ],
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
