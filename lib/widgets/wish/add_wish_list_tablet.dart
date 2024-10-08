import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/show_info_dialog.dart';
import 'package:goodwishes/Models/wish_category_model.dart';
import 'package:goodwishes/Models/wish_model.dart';
import 'package:goodwishes/pages/add_wish_category_page.dart';
import 'package:goodwishes/widgets/goods/add_photo.dart';
import 'package:goodwishes/widgets/wish/add_wish_list_el.dart';
import 'package:goodwishes/widgets/date_picker.dart';
import 'package:goodwishes/widgets/memo_text_input.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:goodwishes/widgets/submit_button.dart';
import 'package:goodwishes/widgets/tag.dart';
import 'package:goodwishes/widgets/text_input.dart';
import 'package:provider/provider.dart';

class AddWishListTablet extends StatefulWidget {
  const AddWishListTablet({
    super.key,
  });

  @override
  State<AddWishListTablet> createState() => _AddWishListTabletState();
}

class _AddWishListTabletState extends State<AddWishListTablet> {
  final formKey = GlobalKey<FormState>();
  Uint8List thumbnail = Uint8List.fromList([]);
  String wishName = ' ';
  String date =
      "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
  String category = '카테고리 없음';
  String location = ' ';
  String memo = ' ';
  String amount = '0';
  String wishPrice = '0';
  String rowPrice = '0';
  List<String> tagList = [];

  @override
  Widget build(BuildContext context) {
    final wishCategoryList = context.read<WishCategoryListProvider>();
    final wishList = Provider.of<WishListProvider>(context);

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
      setState(() {
        category = pickedCategory;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20), // 둥근 모서리 적용
          child: SizedBox(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width / 2.3,
            height: MediaQuery.of(context).size.width / 2.3,
            child: AddPhoto(
              onUpload: (val) {
                thumbnail = val;
              },
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 60,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      leftText: '추가 일자',
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
                      leftText: '희망 수량',
                      rightWidget: TextInput(
                        onSaved: (val) {
                          amount = val!;
                        },
                        hintText: '희망 수량',
                        keyboardType: TextInputType.number,
                        initVal: '0',
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
                        initVal: '0',
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
                        initVal: '0',
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
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
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
                          wishCategoryList.upCountCategory(category);
                          // context.read<wishListProvider>().addGoods(newWish);
                          // print(wishList);
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
