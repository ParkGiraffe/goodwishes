import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/category_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/pages/add_category_page.dart';
import 'package:goodwishes/pages/submit_dialog.dart';
import 'package:goodwishes/widgets/add_photo.dart';
import 'package:goodwishes/widgets/add_wish_list_el.dart';
import 'package:goodwishes/widgets/date_picker.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/submit_button.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';
import 'package:provider/provider.dart';

class AddWishList extends StatefulWidget {
  const AddWishList({
    super.key,
  });

  @override
  State<AddWishList> createState() => _AddWishListState();
}

class _AddWishListState extends State<AddWishList> {
  final formKey = GlobalKey<FormState>();
  Uint8List thumbnail = Uint8List.fromList([]);
  String wishName = '';
  String date =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
  String category = '일반';
  String location = '';
  String memo = '';
  String amount = '';
  String wishPrice = '';
  String rowPrice = '';
  List<String> tagList = [];

  @override
  Widget build(BuildContext context) {
    final categoryList = context.read<CategoryListProvider>();
    final wishList = Provider.of<WishListProvider>(context);

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
                AddWishListEl(
                  leftText: '굿즈 이름',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      wishName = val!;
                    },
                    hintText: '굿즈 이름',
                  ),
                ),
                AddWishListEl(
                  leftText: '구매 일자',
                  rightWidget: DatePicker(
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
                  leftText: '소지 수량',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      amount = val!;
                    },
                    hintText: '소지 수량',
                    keyboardType: TextInputType.number,
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
                  ),
                ),

                AddWishListEl(
                  leftText: '발견 위치',
                  rightWidget: TextInput(
                    onSaved: (val) {
                      location = val!;
                    },
                    hintText: '발견 위치',
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
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      String createdAt = DateTime.now().toString();
                      Wish newWish = Wish(
                        id: createdAt,
                        thumbnail: thumbnail,
                        wishName: wishName,
                        date: date,
                        category: category,
                        location: location,
                        memo: memo,
                        amount: int.parse(amount),
                        wishPrice: int.parse(wishPrice),
                        rowPrice: int.parse(rowPrice),
                        tagList: tagList,
                      );
                      // print(newWish.thumbnail);
                      wishList.addWish(newWish);
                      categoryList.upCountCategory(category);
                      // context.read<wishListProvider>().addGoods(newWish);
                      // print(wishList);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const SubmitDialog();
                          });
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
