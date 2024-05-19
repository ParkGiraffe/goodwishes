import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/add_goods_list_el.dart';
import 'package:goodwishes/widgets/date_picker.dart';
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
          AddGoodsListEl(leftText: '구매 일자', rightWidget: DatePicker()),
          AddGoodsListEl(
            leftText: '굿즈 분류',
            rightWidget: TextInput(
              hintText: '굿즈 분류',
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
