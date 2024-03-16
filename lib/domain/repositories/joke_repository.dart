import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<DataState<List<String>>> getAllCategories();

  Future<DataState<Joke>> getCategoryJoke(String category);

  Future<DataState<List<Joke>>> searchJoke(String query);
}
