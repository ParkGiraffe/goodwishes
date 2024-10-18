import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

class StackTopNavigationBar extends StatelessWidget {
  static const double iconSize = UIDefault.buttonSize;

  const StackTopNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: UIDefault.sizedBoxHeight * 2.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // page title
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                iconSize: iconSize,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
