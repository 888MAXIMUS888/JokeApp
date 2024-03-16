import 'package:flutter/material.dart';
import 'package:joke_app/generated/l10n.dart';

class SearchField extends StatelessWidget {
  void Function(String) onChanged;

  SearchField({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          label: Text(S.of(context).search),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38, width: 1.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onChanged: (String query) => onChanged(query),
      ),
    );
  }
}
