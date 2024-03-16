import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/domain/repositories/joke_repository.dart';
import 'package:joke_app/domain/usecases/usecase.dart';

class SearchJoke implements UseCase<DataState<List<Joke>>, String> {
  final JokeRepository _jokeRepository;

  SearchJoke(this._jokeRepository);

  @override
  Future<DataState<List<Joke>>> call({required String params}) async {
    return _jokeRepository.searchJoke(params);
  }
}
