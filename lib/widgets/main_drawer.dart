import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';
import 'package:goodwishes/pages/tablet/wish_main_page_tablet.dart';
import 'package:goodwishes/widgets/section_title.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: UIDefault.activeColor,
            ),
            child: SectionTitle(titleText: 'Drawer Header'),
          ),
          DrawerTile(
            title: '굿즈',
            icon: Icons.home,
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.home,
        size: UIDefault.buttonSize * 1.5,
      ),
      title: const SectionTitle(
        titleText: '굿즈',
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WishMainPageTablet()),
        );
      },
    );
  }
}
