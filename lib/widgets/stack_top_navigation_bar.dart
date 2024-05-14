import 'package:flutter/material.dart';

class StackTopNavigationBar extends StatelessWidget {
  static const double iconSize = 36;

  const StackTopNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            // padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // page title
                Icon(
                  Icons.arrow_back,
                  size: iconSize,
                ),

                // profile icon
                Row(
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
              ],
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
