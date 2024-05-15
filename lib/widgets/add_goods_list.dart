import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';

class AddGoodsList extends StatelessWidget {
  const AddGoodsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          AddGoodsListEl(
            leftText: '굿즈 이름',
            rightWidget: TextInput(
              hintText: '굿즈 이름',
            ),
          ),
          AddGoodsListEl(
            leftText: '구매 일자',
            rightWidget: TextInput(
              hintText: '2024.xx.xx',
            ),
          ),
          AddGoodsListEl(
            leftText: '카테고리',
            rightWidget: TextInput(
              hintText: '카테고리',
            ),
          ),
          AddGoodsListEl(leftText: '태그 설정', rightWidget: Tag()),
          AddGoodsListEl(
            leftText: '소지 수량',
            rightWidget: TextInput(
              hintText: '소지 수량',
            ),
          ),
          AddGoodsListEl(
            leftText: '구매 가격',
            rightWidget: TextInput(
              hintText: '구매 가격',
            ),
          ),
          AddGoodsListEl(
            leftText: '구매 방법',
            rightWidget: TextInput(
              hintText: '구매 방법',
            ),
          ),
          AddGoodsListEl(
            leftText: '보관 장소',
            rightWidget: TextInput(
              hintText: '보관 장소',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SectionTitle(titleText: '메모'),
          SizedBox(
            height: 5,
          ),
          MemoTextInput()
        ],
      ),
    );
  }
}

class AddGoodsListEl extends StatelessWidget {
  final String leftText;
  final Widget rightWidget;
  const AddGoodsListEl({
    super.key,
    required this.leftText,
    required this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                leftText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              rightWidget,
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
