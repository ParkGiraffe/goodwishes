import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/profile_model.dart';
import 'package:goodwishes/Providers/wish_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/profile_icon_big.dart';
import 'package:goodwishes/widgets/section_title.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfiletProvider>(context);
    final goodsAmount = Provider.of<GoodsListProvider>(context).goodsAmount;
    final wishAmount = Provider.of<WishListProvider>(context).wishAmount;

    // XFile? image;
    final ImagePicker picker = ImagePicker();

    // 이미지를 가져오는 함수
    Future getImage(ImageSource imageSource) async {
      // pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
      final XFile? pickedFile = await picker.pickImage(source: imageSource);

      if (pickedFile != null) {
        List<int> imageBytes = await pickedFile.readAsBytes();
        setState(() {
          // image = XFile(pickedFile.path);
          profileProvider.changeProfile(Uint8List.fromList(imageBytes));
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const SectionTitle(
          titleText: 'profile',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: UIDefault.sizedBoxHeight * 2,
                ),
                ProfileIconBig(
                    profile: profileProvider.profile, onUpload: getImage),
                const SizedBox(
                  height: UIDefault.sizedBoxHeight * 2,
                ),
                AmountText(
                  text: '가지고 있는 굿즈의 수',
                  amount: goodsAmount,
                ),
                AmountText(
                  text: '원하는 위시의 수',
                  amount: wishAmount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AmountText extends StatelessWidget {
  const AmountText({
    super.key,
    required this.amount,
    required this.text,
  });

  final int amount;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$text : $amount',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: UIDefault.sizedBoxHeight,
        ),
      ],
    );
  }
}
