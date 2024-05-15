import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goodwishes/widgets/category_list.dart';
import 'package:goodwishes/widgets/goods_detail_list_el.dart';
import 'package:goodwishes/widgets/section_title.dart';

class AddGoodsList extends StatelessWidget {
  const AddGoodsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          AddGoodsListEl(),
        ],
      ),
    );
  }
}

class AddGoodsListEl extends StatelessWidget {
  const AddGoodsListEl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '굿즈 이름',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        Expanded(
          child: TextFormField(
            style: TextStyle(
              fontSize: 15,
            ),
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.only(bottom: 0),
              hintText: '굿즈 이름',
            ),
          ),
        ),
      ],
    );
  }
}
