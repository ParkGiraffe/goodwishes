import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';

class AddGoodsList extends StatefulWidget {
  const AddGoodsList({
    super.key,
  });

  @override
  State<AddGoodsList> createState() => _AddGoodsListState();
}

class _AddGoodsListState extends State<AddGoodsList> {
  DateTime date = DateTime.now();

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
          const AddGoodsListEl(
            leftText: '굿즈 이름',
            rightWidget: TextInput(
              hintText: '굿즈 이름',
            ),
          ),
          AddGoodsListEl(
            leftText: '구매 일자',
            rightWidget: TextButton(
              style: const ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    color: Colors.black,
                  ),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.zero,
                ),
              ),
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  setState(() {
                    date = selectedDate;
                  });
                }
              },
              child: Text(
                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
              ),
            ),
          ),
          const AddGoodsListEl(
            leftText: '카테고리',
            rightWidget: TextInput(
              hintText: '카테고리',
            ),
          ),
          const AddGoodsListEl(leftText: '태그 설정', rightWidget: Tag()),
          const AddGoodsListEl(
            leftText: '소지 수량',
            rightWidget: TextInput(
              hintText: '소지 수량',
            ),
          ),
          const AddGoodsListEl(
            leftText: '구매 가격',
            rightWidget: TextInput(
              hintText: '구매 가격',
            ),
          ),
          const AddGoodsListEl(
            leftText: '구매 방법',
            rightWidget: TextInput(
              hintText: '구매 방법',
            ),
          ),
          const AddGoodsListEl(
            leftText: '보관 장소',
            rightWidget: TextInput(
              hintText: '보관 장소',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SectionTitle(titleText: '메모'),
          const SizedBox(
            height: 5,
          ),
          const MemoTextInput()
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
