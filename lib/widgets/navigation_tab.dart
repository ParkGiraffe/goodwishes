import 'package:flutter/material.dart';

class NavigationTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const NavigationTab({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(
        icon,
        size: 35,
      ),
      iconMargin: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
