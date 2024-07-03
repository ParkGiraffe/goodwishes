import 'package:flutter/material.dart';
import 'package:goodwishes/Providers/profile_model.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

@override
class ProfileIcon extends StatelessWidget {
  // final String userName;
  final Profile profile;
  final Function onClick;

  const ProfileIcon({
    super.key,
    required this.profile,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 50,
        height: 50,
        // margin: const EdgeInsets.only(
        //   right: 30,
        // ),
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
              image: profile.isDefault
                  ? const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(UIDefault.defaultBackgroundImageRoute),
                    )
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(profile.thumbnail),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
