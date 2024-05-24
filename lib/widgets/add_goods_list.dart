import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_list.dart';
import 'package:goodwishes/widgets/add_goods_list_el.dart';
import 'package:goodwishes/widgets/add_photo.dart';
import 'package:goodwishes/widgets/date_picker.dart';
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
  final formKey = GlobalKey<FormState>();
  String thumbnail = '';
  String goodsName = '';
  String date = '';
  String category = '';
  String location = '';
  String wayToBuy = '';
  String memo = '';
  String amount = '';
  String price = '';
  List<String> tagList = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const AddPhoto(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                AddGoodsListEl(
                  leftText: '굿즈 이름',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      goodsName = val!;
                    },
                    hintText: '굿즈 이름',
                  ),
                ),
                AddGoodsListEl(
                  leftText: '구매 일자',
                  rightWidget: DatePicker(
                    callback: (DateTime newDate) {
                      date =
                          "${newDate.year.toString()}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";
                    },
                  ),
                ),
                AddGoodsListEl(
                  leftText: '굿즈 분류',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      category = val!;
                    },
                    hintText: '굿즈 분류',
                  ),
                ),
                const AddGoodsListEl(
                  leftText: '태그 설정',
                  rightWidget: Tag(),
                ),
                AddGoodsListEl(
                  leftText: '소지 수량',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      amount = val!;
                    },
                    hintText: '소지 수량',
                    keyboardType: TextInputType.number,
                  ),
                ),
                AddGoodsListEl(
                  leftText: '구매 가격',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      price = val!;
                    },
                    hintText: '구매 가격',
                    keyboardType: TextInputType.number,
                  ),
                ),
                AddGoodsListEl(
                  leftText: '구매 방법',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      wayToBuy = val!;
                    },
                    hintText: '구매 방법',
                  ),
                ),
                AddGoodsListEl(
                  leftText: '보관 장소',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      location = val!;
                    },
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
                MemoTextInput(
                  onSaved: (val) {
                    memo = val!;
                  },
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Goods newGoods = Goods(
                        thumbnail: thumbnail,
                        goodsName: goodsName,
                        date: date,
                        category: category,
                        location: location,
                        wayToBuy: wayToBuy,
                        memo: memo,
                        amount: int.parse(amount),
                        price: int.parse(price),
                        tagList: tagList,
                      );
                      print(newGoods);
                    }
                  },
                  child: const Text('submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
