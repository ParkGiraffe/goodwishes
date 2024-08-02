import 'package:flutter/material.dart';
import 'package:goodwishes/Models/profile_model.dart';
import 'package:goodwishes/pages/profile_page.dart';
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
          builder: (context) => ProfilePage(),
        ),
      );
    }

    return SizedBox(
      height: 50,
      // padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // page title
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: -2,
            ),
          ),

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
