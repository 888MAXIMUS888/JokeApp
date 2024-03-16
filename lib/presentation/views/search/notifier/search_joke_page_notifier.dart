import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/domain/usecases/search_joke_usecase.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/search/notifier/search_joke_page_state.dart';
import 'package:joke_app/providers.dart';

final searchJokePageStateProvider =
    StateNotifierProvider<SearchJokeStateNotifier, SearchJokePageState>(
  (ref) => SearchJokeStateNotifier(
    searchJoke: ref.read(searchJokeProvider),
  ),
);

class SearchJokeStateNotifier extends StateNotifier<SearchJokePageState> {
  SearchJokeStateNotifier({
    required SearchJoke searchJoke,
  })  : _searchJoke = searchJoke,
        super(const SearchJokePageState(jokes: []));

  final SearchJoke _searchJoke;

  Future<void> searchJoke(String query) async {
    state = state.copyWith(status: PageStatus.loading);

    final dataState = await _searchJoke(params: query);
    if (dataState is DataSuccess<List<Joke>>) {
      state = state.copyWith(status: PageStatus.success, jokes: dataState.data);
    }
    if (dataState is DataFailed<List<Joke>>) {
      state = state.copyWith(
          status: PageStatus.failure, errorMsg: dataState.errorMsg);
    }
  }
}
