import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/generated/l10n.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/favorite_view/notifier/favorite_joke_page_notifier.dart';
import 'package:joke_app/presentation/views/search/notifier/search_joke_page_notifier.dart';
import 'package:joke_app/presentation/widgets/custom_list_view.dart';
import 'package:joke_app/presentation/widgets/error_massage.dart';
import 'package:joke_app/presentation/widgets/search_fiels.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<SearchView> {
  @override
  Widget build(BuildContext context) {
    final status = ref.watch(
      searchJokePageStateProvider.select((p) => p.status),
    );

    return SafeArea(
      child: Column(
        children: [
          SearchField(
            onChanged: (String query) {
              /// start of search after 3 characters entered
              if (query.length >= 3) {
                ref
                    .read(searchJokePageStateProvider.notifier)
                    .searchJoke(query);
              }
            },
          ),
          status == PageStatus.initial
              ? Expanded(child: Center(child: Text(S.of(context).enterWord)))
              : status == PageStatus.loading
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                      final state = ref.watch(searchJokePageStateProvider);
                      final favoriteState =
                          ref.watch(favoriteJokePageStateProvider);

                      final List<String> favoriteIds =
                          favoriteState.jokes.map((e) => e.id).toList();

                      return status == PageStatus.failure
                          ? ErrorMassage(errorMsg: state.errorMsg)
                          : Expanded(
                              child: CustomListView(
                                  itemCount: state.jokes.length,
                                  title: state.jokes,
                                  favoriteJokes: favoriteIds,
                                  onTapFavorite: (int index) {
                                    _onTapFavoriteButton(
                                      favoriteIds
                                          .contains(state.jokes[index].id),
                                      state.jokes[index],
                                    );
                                  }),
                            );
                    })
        ],
      ),
    );
  }

  void _onTapFavoriteButton(bool isContains, Joke joke) {
    isContains
        ? ref
            .read(favoriteJokePageStateProvider.notifier)
            .removeFavoriteJoke(joke)
        : ref
            .read(favoriteJokePageStateProvider.notifier)
            .saveFavoriteJoke(joke);
  }
}
