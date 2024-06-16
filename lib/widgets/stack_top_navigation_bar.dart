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
          // padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
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

              /*
              // profile icon
              const Row(
                children: [
                  Icon(
                    Icons.home,
                    size: iconSize,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.search,
                    size: iconSize,
                  ),
                ],
              )
              */
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
