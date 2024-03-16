import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/domain/usecases/get_category_joke_usecase.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/category_joke/notifier/category_joke_page_state.dart';
import 'package:joke_app/providers.dart';

final categoryJokePageStateProvider =
    StateNotifierProvider<CategoryJokeStateNotifier, CategoryJokePageState>(
  (ref) => CategoryJokeStateNotifier(
    getCategoryJoke: ref.read(getCategoryJokeProvider),
  ),
);

class CategoryJokeStateNotifier extends StateNotifier<CategoryJokePageState> {
  CategoryJokeStateNotifier({
    required GetCategoryJoke getCategoryJoke,
  })  : _getCategoryJoke = getCategoryJoke,
        super(const CategoryJokePageState(
            joke: Joke(iconUrl: '', id: '', joke: '')));

  final GetCategoryJoke _getCategoryJoke;

  Future<void> getCategoryJoke(String category) async {
    state = state.copyWith(status: PageStatus.loading);

    final dataState = await _getCategoryJoke(params: category);
    if (dataState is DataSuccess<Joke>) {
      state = state.copyWith(status: PageStatus.success, joke: dataState.data);
    } else if (dataState is DataFailed<Joke>) {
      state = state.copyWith(
          status: PageStatus.failure, errorMsg: dataState.errorMsg);
    }
  }
}
