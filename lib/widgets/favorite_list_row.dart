import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/favorite_list_el.dart';

class FavoriteListRow extends StatelessWidget {
  final String leftText;
  final String leftImage;
  final String leftDate;
  final String rightText;
  final String rightImage;
  final String rightDate;

  const FavoriteListRow({
    super.key,
    required this.leftText,
    required this.leftImage,
    required this.leftDate,
    this.rightText = '',
    this.rightImage = '',
    this.rightDate = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rightDate == '' && rightImage == '' && rightText == ''
              ? [
                  FavoriteListEl(
                    text: leftText,
                    date: leftDate,
                    imageRoute: leftImage,
                  ),
                ]
              : [
                  FavoriteListEl(
                    text: leftText,
                    date: leftDate,
                    imageRoute: leftImage,
                  ),
                  FavoriteListEl(
                    text: rightText,
                    date: rightDate,
                    imageRoute: rightImage,
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
