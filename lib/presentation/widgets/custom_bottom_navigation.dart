import 'package:flutter/material.dart';
import 'package:joke_app/presentation/theme/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabController? controller;
  final List<Widget> tabs;
  final ValueChanged<int> onItemSelected;

  CustomBottomNavigationBar({
    this.controller,
    required this.tabs,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    const double bottomNavigationBarHeight = 60;
    return Container(
      height: bottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
      color: backgroundColor,
      alignment: Alignment.topCenter,
      child: TabBar(
        padding: const EdgeInsets.all(0),
        automaticIndicatorColorAdjustment: false,
        controller: controller,
        dividerColor: transparent,
        indicatorColor: transparent,
        labelStyle: Theme.of(context)
            .primaryTextTheme
            .labelMedium
            ?.copyWith(letterSpacing: 0),
        onTap: (index) => onItemSelected(index),
        tabs: tabs,
      ),
    );
  }
}
