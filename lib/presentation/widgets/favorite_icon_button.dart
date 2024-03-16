import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  final Function onPressed;
  final bool isFavorite;
  const FavoriteIconButton(
      {required this.onPressed, required this.isFavorite, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed(),
        icon: isFavorite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border));
  }
}
