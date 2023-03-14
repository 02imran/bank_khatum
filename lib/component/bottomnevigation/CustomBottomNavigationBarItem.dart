import 'package:flutter/material.dart';


class CustomBottomNavigationBarItem {
  CustomBottomNavigationBarItem({
    required this.icon,
    required this.title,
    this.titleTextColor = const Color(0XFFFFFFFF),
  })  : assert(icon != null),
        assert(title.isNotEmpty);
  final IconData icon;
  final String title;
  final Color titleTextColor;
}
