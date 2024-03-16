import 'package:flutter/material.dart';

class BottomNavBarItem {
  final Icon icon;
  final String title;
  final Widget view;
  final int index;

  BottomNavBarItem(
      {required this.icon,
      required this.title,
      required this.view,
      required this.index});
}
