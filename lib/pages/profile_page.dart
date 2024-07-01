import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/goods_model.dart';
import 'package:goodwishes/Providers/profile_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/widgets/goods/category_detail_list.dart';
import 'package:goodwishes/widgets/profile_icon.dart';
import 'package:goodwishes/widgets/section_title.dart';

import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {


  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<GoodsListProvider>(context).goodsList;
    
    final profile = Provider.of<ProfiletProvider>(context).profile;



    return Scaffold(
      appBar: AppBar(
        title: const SectionTitle(
          titleText: 'profile',
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
                ProfileIcon(profile: profile, onUpload: onUpload),
              SizedBox(
                height: UIDefault.sizedBoxHeight,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
