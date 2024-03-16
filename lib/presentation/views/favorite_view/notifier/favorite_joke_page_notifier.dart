import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/data/datasources/local/local_storage.dart';
import 'package:joke_app/data/mapper/joke_mapper.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/favorite_view/notifier/favorite_joke_page_state.dart';
import 'package:joke_app/providers.dart';
import 'package:joke_app/data/models/joke.dart' as Model;

final favoriteJokePageStateProvider =
    StateNotifierProvider<FavoriteJokesStateNotifier, FavoriteJokesPageState>(
  (ref) => FavoriteJokesStateNotifier(
    localStorage: ref.read(localStorageProvider),
  ),
);

class FavoriteJokesStateNotifier extends StateNotifier<FavoriteJokesPageState> {
  FavoriteJokesStateNotifier({
    required LocalStorage localStorage,
  })  : _localStorage = localStorage,
        super(const FavoriteJokesPageState(jokes: []));

  final LocalStorage _localStorage;
  List<Joke> favoriteJokes = [];

  Future<void> saveFavoriteJoke(Joke jokes) async {
    favoriteJokes.add(jokes);

    await _localStorage.saveJokes(list: jsonEncode(favoriteJokes).toString());
    state = state.copyWith(status: PageStatus.success, jokes: favoriteJokes);
  }

  Future<void> removeFavoriteJoke(Joke joke) async {
    favoriteJokes
        .remove(favoriteJokes.firstWhere((element) => element.id == joke.id));

    await _localStorage.saveJokes(list: jsonEncode(favoriteJokes).toString());
    state = state.copyWith(status: PageStatus.success, jokes: favoriteJokes);
  }

  Future<void> loadFavoriteJoke() async {
    state = state.copyWith(status: PageStatus.loading);

    final dataState = await _localStorage.loadJokes();
    try {
      if (dataState != null) {
        final List<Joke> selectedProductRequest =
            (jsonDecode(dataState) as List)
                .map((e) => JokeMapper().mapToEntity(Model.Joke.fromJson(e)))
                .toList();
        favoriteJokes = selectedProductRequest;
        state = state.copyWith(
            status: PageStatus.success, jokes: selectedProductRequest);
      } else {
        state = state.copyWith(status: PageStatus.initial);
      }
    } catch (e) {
      state =
          state.copyWith(status: PageStatus.failure, errorMsg: e.toString());
    }
  }
}
