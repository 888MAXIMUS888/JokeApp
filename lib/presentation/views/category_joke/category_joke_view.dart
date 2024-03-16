import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/generated/l10n.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/category_joke/notifier/category_joke_state_notifier.dart';
import 'package:joke_app/presentation/views/favorite_view/notifier/favorite_joke_page_notifier.dart';
import 'package:joke_app/presentation/widgets/error_massage.dart';
import 'package:joke_app/presentation/widgets/favorite_icon_button.dart';
import 'package:joke_app/presentation/widgets/main_scaffold.dart';

class CategoryJokeView extends ConsumerStatefulWidget {
  static CategoryJokeView builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CategoryJokeView();
  const CategoryJokeView({super.key});

  @override
  ConsumerState<CategoryJokeView> createState() => _CategoryJokeViewState();
}

class _CategoryJokeViewState extends ConsumerState<CategoryJokeView> {
  @override
  Widget build(BuildContext context) {
    final status = ref.watch(
      categoryJokePageStateProvider.select((p) => p.status),
    );

    return MainScaffold(
      appBarTitle: S.of(context).joke,
      body: status == PageStatus.initial || status == PageStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final state = ref.watch(categoryJokePageStateProvider);

              final favoriteState = ref.watch(favoriteJokePageStateProvider);

              final List<String> favoriteIds =
                  favoriteState.jokes.map((e) => e.id).toList();

              return status == PageStatus.failure
                  ? ErrorMassage(errorMsg: state.errorMsg)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// All url icons are broken
                        // Image.network(state.iconUrl),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.joke.joke,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        FavoriteIconButton(
                          onPressed: () {
                            _onTapFavoriteButton(
                              favoriteIds.contains(state.joke.id),
                              state.joke,
                            );
                          },
                          isFavorite: favoriteIds.contains(state.joke.id),
                        )
                      ],
                    );
            }),
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
