import 'package:flutter/material.dart';
import 'package:joke_app/presentation/theme/colors.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final String? appBarTitle;
  final Widget? floatingActionButton;
  final VoidCallback? onPressed;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;

  const MainScaffold(
      {required this.body,
      this.appBarTitle,
      this.floatingActionButton,
      this.onPressed,
      this.actions,
      this.bottomNavigationBar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        appBar: appBarTitle != null
            ? AppBar(
                backgroundColor: backgroundColor,
                title: Text(appBarTitle ?? ''),
                actions: actions,
              )
            : null,
        body: body);
  }
}
