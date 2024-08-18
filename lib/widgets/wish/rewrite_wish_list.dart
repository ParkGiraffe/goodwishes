import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';

import 'package:goodwishes/Models/wish_category_model.dart';
import 'package:goodwishes/Models/wish_model.dart';

import 'package:goodwishes/pages/add_wish_category_page.dart';

import 'package:goodwishes/widgets/wish/add_wish_list_el.dart';

import 'package:goodwishes/widgets/date_picker.dart';
import 'package:goodwishes/widgets/goods/add_photo.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/submit_button.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';
import 'package:provider/provider.dart';

class RewriteWishList extends StatefulWidget {
  final Wish wish;
  const RewriteWishList({super.key, required this.wish});

  @override
  State<RewriteWishList> createState() => _RewriteWishListState();
}

class _RewriteWishListState extends State<RewriteWishList> {
  final formKey = GlobalKey<FormState>();

  late String id;
  late Uint8List thumbnail;
  late String wishName;
  late String date;
  late String category;
  late String location;
  late String memo;
  late String amount;
  late String wishPrice;
  late String rowPrice;
  late List<String> tagList;

  @override
  void initState() {
    super.initState();
    id = widget.wish.id;
    thumbnail = widget.wish.thumbnail;
    wishName = widget.wish.wishName;
    category = widget.wish.category;
    date = widget.wish.date;
    location = widget.wish.location;
    memo = widget.wish.memo;
    amount = widget.wish.amount.toString();
    wishPrice = widget.wish.wishPrice.toString();
    rowPrice = widget.wish.rowPrice.toString();
    tagList = [];
  }

  @override
  Widget build(BuildContext context) {
    final wishCategoryList = context.read<WishCategoryListProvider>();
    final wishList = Provider.of<WishListProvider>(context);

    final formKey = GlobalKey<FormState>();

    Future<void> categoryButtonHandler(BuildContext context) async {
      // final wishCategoryList = context.read<CategoryListProvider>();
      final pickedCategory = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ChangeNotifierProvider<WishCategoryListProvider>.value(
            value: wishCategoryList,
            builder: (context, child) {
              // print(wishCategoryList.wishCategoryList);
              return const AddWishCategoryPage();
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
                AddWishListEl(
                  leftText: '굿즈 이름',
                  rightWidget: TextInput(
                    initVal: wishName,
                    onSaved: (val) {
                      wishName = val!;
                    },
                    hintText: '굿즈 이름',
                    //
                  ),
                ),
                AddWishListEl(
                  leftText: '추가 일자',
                  rightWidget: DatePicker(
                    initVal: date,
                    callback: (DateTime newDate) {
                      date =
                          "${newDate.year.toString()}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";
                    },
                  ),
                ),
                AddWishListEl(
                  leftText: '굿즈 분류',
                  rightWidget: Tag(
                    tagName: category,
                    onNavigate: categoryButtonHandler,
                  ),
                ),
                // AddWishListEl(
                //   leftText: '태그 설정',
                //   rightWidget: Tag(
                //     tagName: 'sample',
                //     onNavigate: categoryButtonHandler,
                //   ),
                // ),
                AddWishListEl(
                  leftText: '희망 수량',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      amount = val!;
                    },
                    hintText: '희망 수량',
                    keyboardType: TextInputType.number,
                    initVal: amount,
                  ),
                ),
                AddWishListEl(
                  leftText: '희망 가격',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      wishPrice = val!;
                    },
                    hintText: '희망 가격',
                    keyboardType: TextInputType.number,
                    initVal: wishPrice,
                  ),
                ),
                AddWishListEl(
                  leftText: '최저 가격',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      rowPrice = val!;
                    },
                    hintText: '최저 가격',
                    keyboardType: TextInputType.number,
                    initVal: rowPrice,
                  ),
                ),

                AddWishListEl(
                  leftText: '발견 위치',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      location = val!;
                    },
                    hintText: '발견 위치',
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

                      Wish newWish = Wish(
                        id: id,
                        thumbnail: thumbnail,
                        wishName: wishName,
                        date: date,
                        category: category,
                        location: location,
                        memo: memo,
                        amount: int.parse(amount),
                        rowPrice: int.parse(rowPrice),
                        wishPrice: int.parse(wishPrice),
                        tagList: tagList,
                      );
                      // print(newGoods.thumbnail);
                      wishCategoryList.rewriteCount(
                          widget.wish.category, category);
                      wishList.addWish(newWish);
                      wishCategoryList.upCountCategory(category);
                      // context.read<GoodsListProvider>().addGoods(newGoods);
                      // print(wishList);
                      Navigator.pop(context);
                      showInfoDialog(
                        context,
                        '알림',
                        '수정되었습니다.',
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
