import 'package:flutter/material.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/presentation/widgets/favorite_icon_button.dart';

class CustomListView extends StatelessWidget {
  final int itemCount;
  final List<Joke> title;
  final Widget? trailing;
  final List<String> favoriteJokes;
  final Function(int)? onTap;
  final Function(int)? onTapFavorite;

  const CustomListView(
      {required this.itemCount,
      required this.title,
      this.trailing,
      required this.favoriteJokes,
      this.onTap,
      this.onTapFavorite,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            title[index].joke,
          ),
          trailing: favoriteJokes.isNotEmpty
              ? FavoriteIconButton(
                  onPressed: () => onTapFavorite?.call(index),
                  isFavorite: favoriteJokes.contains(title[index].id),
                )
              : const SizedBox(),
          onTap: () => onTap?.call(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
