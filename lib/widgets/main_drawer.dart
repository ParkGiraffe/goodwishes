import 'package:flutter/material.dart';
import 'package:goodwishes/constants/ui_numbers.dart';

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
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: UIDefault.activeColor,
          //   ),
          //   child: Text('Drawer Header'),
          // ),
          DrawerTile(),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('굿즈'),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }
}
