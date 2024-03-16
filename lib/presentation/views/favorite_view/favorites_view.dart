import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/generated/l10n.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/favorite_view/notifier/favorite_joke_page_notifier.dart';
import 'package:joke_app/presentation/widgets/custom_list_view.dart';
import 'package:joke_app/presentation/widgets/error_massage.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(favoriteJokePageStateProvider.notifier).loadFavoriteJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(
      favoriteJokePageStateProvider.select((p) => p.status),
    );

    return SafeArea(
      child: Column(
        children: [
          status == PageStatus.loading
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                  final state = ref.watch(favoriteJokePageStateProvider);
                  return status == PageStatus.failure
                      ? ErrorMassage(errorMsg: state.errorMsg)
                      : state.jokes.isEmpty
                          ? Expanded(
                              child:
                                  Center(child: Text(S.of(context).emptyList)))
                          : Expanded(
                              child: CustomListView(
                                  itemCount: state.jokes.length,
                                  title: state.jokes,
                                  favoriteJokes: _getFavoriteIds(),
                                  onTapFavorite: (int index) =>
                                      _removeFavoriteJoke(state.jokes[index])),
                            );
                })
        ],
      ),
    );
  }

  List<String> _getFavoriteIds() {
    return ref
        .read(favoriteJokePageStateProvider)
        .jokes
        .map((e) => e.id)
        .toList();
  }

  void _removeFavoriteJoke(Joke jokes) {
    ref.read(favoriteJokePageStateProvider.notifier).removeFavoriteJoke(jokes);
  }
}
