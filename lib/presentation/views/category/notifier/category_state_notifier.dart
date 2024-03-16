import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/usecases/get_categories_usecase.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/providers.dart';

final categoryPageStateProvider =
    StateNotifierProvider<CategoriesStateNotifier, CategoryPageState>(
  (ref) => CategoriesStateNotifier(
    getAllCharacters: ref.read(getCategoriesProvider),
  ),
);

class CategoriesStateNotifier extends StateNotifier<CategoryPageState> {
  CategoriesStateNotifier({
    required GetCategories getAllCharacters,
  })  : _getAllCharacters = getAllCharacters,
        super(const CategoryPageState());

  final GetCategories _getAllCharacters;

  Future<void> getCategories() async {
    state = state.copyWith(status: PageStatus.loading);

    final dataState = await _getAllCharacters();
    if (dataState is DataSuccess<List<String>>) {
      state = state.copyWith(
        status: PageStatus.success,
        categories: dataState.data,
      );
    } else if (dataState is DataFailed<List<String>>) {
      state = state.copyWith(
          status: PageStatus.failure, errorMsg: dataState.errorMsg);
    }
  }
}
