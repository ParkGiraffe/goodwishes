import 'package:flutter/material.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/pages/profile_page.dart';
import 'package:goodwishes/widgets/page_title.dart';
import 'package:goodwishes/widgets/profile_icon.dart';
import 'package:provider/provider.dart';

class TopWithProfile extends StatelessWidget {
  final String title;
  const TopWithProfile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfiletProvider>(context);

    void profileClickHandler() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
    }

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // page title
          PageTitle(title: title),

          // profile icon
          ProfileIcon(
            profile: profileProvider.profile,
            onClick: profileClickHandler,
          ),
        ],
      ),
    );
  }
}
