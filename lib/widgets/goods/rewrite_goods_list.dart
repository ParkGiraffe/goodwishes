import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/Models/category_model.dart';
import 'package:goodwishes/Models/goods_model.dart';
import 'package:goodwishes/pages/add_category_page.dart';
import 'package:goodwishes/pages/text_dialog.dart';
import 'package:goodwishes/widgets/goods/add_goods_list_el.dart';
import 'package:goodwishes/widgets/goods/add_photo.dart';
import 'package:goodwishes/widgets/date_picker.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/submit_button.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';
import 'package:provider/provider.dart';

class RewriteGoodsList extends StatefulWidget {
  final Goods goods;
  const RewriteGoodsList({super.key, required this.goods});

  @override
  State<RewriteGoodsList> createState() => _RewriteGoodsListState();
}

class _RewriteGoodsListState extends State<RewriteGoodsList> {
  final formKey = GlobalKey<FormState>();

  late String id;
  late Uint8List thumbnail;
  late String goodsName;
  late String date;
  late String category;
  late String location;
  late String wayToBuy;
  late String memo;
  late String amount;
  late String price;
  late List<String> tagList;

  @override
  void initState() {
    super.initState();
    id = widget.goods.id;
    thumbnail = widget.goods.thumbnail;
    goodsName = widget.goods.goodsName;
    category = widget.goods.category;
    date = widget.goods.date;
    location = widget.goods.location;
    wayToBuy = widget.goods.wayToBuy;
    memo = widget.goods.memo;
    amount = widget.goods.amount.toString();
    price = widget.goods.price.toString();
    tagList = [];
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = context.read<CategoryListProvider>();
    final goodsList = Provider.of<GoodsListProvider>(context);

    final formKey = GlobalKey<FormState>();

    Future<void> categoryButtonHandler(BuildContext context) async {
      // final categoryList = context.read<CategoryListProvider>();
      final pickedCategory = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChangeNotifierProvider<CategoryListProvider>.value(
            value: categoryList,
            builder: (context, child) {
              // print(categoryList.categoryList);
              return const AddCategoryPage();
            },
          ),
        ),
      );
      if (!mounted) {
        return;
      }
      if (pickedCategory != null) {
        setState(() {
          category = pickedCategory;
        });
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          AddPhoto(
            alreadyImg: thumbnail,
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
                    initVal: goodsName,
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
                    initVal: date,
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
                // AddGoodsListEl(
                //   leftText: '태그 설정',
                //   rightWidget: Tag(
                //     tagName: 'sample',
                //     onNavigate: categoryButtonHandler,
                //   ),
                // ),
                AddGoodsListEl(
                  leftText: '소지 수량',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      amount = val!;
                    },
                    hintText: '소지 수량',
                    keyboardType: TextInputType.number,
                    initVal: amount,
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
                    initVal: price,
                  ),
                ),
                AddGoodsListEl(
                  leftText: '구매 방법',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      wayToBuy = val!;
                    },
                    hintText: '구매 방법',
                    initVal: wayToBuy,
                  ),
                ),
                AddGoodsListEl(
                  leftText: '보관 장소',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      location = val!;
                    },
                    hintText: '보관 장소',
                    initVal: location,
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
                  initVal: memo,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      Goods newGoods = Goods(
                        id: id,
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
                      // print(newGoods.thumbnail);
                      categoryList.rewriteCount(
                          widget.goods.category, category);
                      goodsList.addGoods(newGoods);
                      categoryList.upCountCategory(category);
                      // context.read<GoodsListProvider>().addGoods(newGoods);
                      // print(goodsList);
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const TextDialog(
                            text: '수정되었습니다',
                          );
                        },
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
