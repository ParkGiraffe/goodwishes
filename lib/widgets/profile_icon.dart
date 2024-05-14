import 'package:flutter/material.dart';

@override
class ProfileIcon extends StatelessWidget {
  // final String userName;
  final String profilePicture;

  const ProfileIcon({super.key, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(
        right: 30,
      ),
      padding: const EdgeInsets.all(2.5),
      decoration: const BoxDecoration(
        color: Color(0xFFDBCACA),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(profilePicture),
            ),
          ),
        ),
      ),
    );
  }
}
