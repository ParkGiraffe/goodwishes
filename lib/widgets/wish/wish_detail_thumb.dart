import 'package:flutter/material.dart';
import 'package:goodwishes/Models/wish_model.dart';

class WishDetailThumb extends StatelessWidget {
  final Wish wish;

  const WishDetailThumb({
    super.key,
    required this.wish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(wish.thumbnail),
        ),
      ),
    );
  }
}
