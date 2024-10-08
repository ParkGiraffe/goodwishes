import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/pages/add_category_page.dart';
import 'package:goodwishes/widgets/goods/add_goods_list_el.dart';
import 'package:goodwishes/widgets/goods/add_photo.dart';
import 'package:goodwishes/widgets/date_picker.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/submit_button.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';
import 'package:provider/provider.dart';

class AddGoodsList extends StatefulWidget {
  const AddGoodsList({
    super.key,
  });

  @override
  State<AddGoodsList> createState() => _AddGoodsListState();
}

class _AddGoodsListState extends State<AddGoodsList> {
  final formKey = GlobalKey<FormState>();
  Uint8List thumbnail = Uint8List.fromList([]);
  String goodsName = ' ';
  String date =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
  String category = '카테고리 없음';
  String location = ' ';
  String wayToBuy = ' ';
  String memo = ' ';
  String amount = '0';
  String price = '0';
  List<String> tagList = [];

  @override
  Widget build(BuildContext context) {
    final categoryList = context.read<CategoryListProvider>();
    final goodsList = Provider.of<GoodsListProvider>(context);

    Future<void> categoryButtonHandler(BuildContext context) async {
      final pickedCategory = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChangeNotifierProvider<CategoryListProvider>.value(
            value: categoryList,
            builder: (context, child) {
              return const AddCategoryPage();
            },
          ),
        ),
      );
      if (!mounted) {
        return;
      }
      setState(() {
        category = pickedCategory;
      });
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          AddPhoto(
            onUpload: (val) {
              thumbnail = val;
            },
          ),
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
                    //
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
                  rightWidget: Tag(
                    tagName: category,
                    onNavigate: categoryButtonHandler,
                  ),
                ),
                AddGoodsListEl(
                  leftText: '소지 수량',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      amount = val!;
                    },
                    hintText: '소지 수량',
                    keyboardType: TextInputType.number,
                    initVal: '0',
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
                    initVal: '0',
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
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      String createdAt = DateTime.now().toString();
                      Goods newGoods = Goods(
                        id: createdAt,
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
                      goodsList.addGoods(newGoods);
                      categoryList.upCountCategory(category);

                      showInfoDialog(
                        context,
                        '알림',
                        '등록되었습니다.',
                      );
                    }
                  },
                  child: const SubmitButton(),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
