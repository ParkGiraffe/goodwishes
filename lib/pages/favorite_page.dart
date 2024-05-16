import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/top_with_profile.dart';
import 'package:goodwishes/widgets/horizon_list.dart';
import 'package:goodwishes/widgets/category_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300,
              width: 250,
              margin: const EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/goods.jpeg',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 250,
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
                          '모코코 키링',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('2000.00.00'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
