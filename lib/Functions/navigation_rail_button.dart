import 'package:flutter/material.dart';

NavigationRailDestination navigationRailButton(
  String title,
  IconData icon,
  IconData iconFilled,
) {
  double iconSize = 37;
  return NavigationRailDestination(
    icon: Icon(
      icon,
      size: iconSize,
    ),
    selectedIcon: Icon(
      iconFilled,
      size: iconSize,
    ),
    label: Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
