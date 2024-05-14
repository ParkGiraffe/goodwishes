import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/profile_icon.dart';

class TopWithProfile extends StatelessWidget {
  const TopWithProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      // padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // page title
          Text(
            'GoodsList',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
            ),
          ),

          // profile icon

          ProfileIcon(profilePicture: 'assets/profile.png'),
        ],
      ),
    );
  }
}
