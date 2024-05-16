import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/profile_icon.dart';

class TopWithProfile extends StatelessWidget {
  final String title;
  const TopWithProfile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
              letterSpacing: 0.1,
            ),
          ),

          // profile icon

          const ProfileIcon(profilePicture: 'assets/profile.png'),
        ],
      ),
    );
  }
}
