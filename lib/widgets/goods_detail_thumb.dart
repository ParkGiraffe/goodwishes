import 'package:flutter/material.dart';

class GoodsDetailThumb extends StatelessWidget {
  const GoodsDetailThumb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/goods.jpeg'),
        ),
      ),
    );
  }
}
