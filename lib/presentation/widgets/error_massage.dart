import 'package:flutter/material.dart';
import 'package:joke_app/generated/l10n.dart';

class ErrorMassage extends StatelessWidget {
  final String? errorMsg;
  const ErrorMassage({this.errorMsg, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).error),
        Text(errorMsg.toString()),
      ],
    ));
  }
}
