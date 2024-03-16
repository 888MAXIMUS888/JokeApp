import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/domain/repositories/joke_repository.dart';
import 'package:joke_app/domain/usecases/usecase.dart';

class GetCategoryJoke implements UseCase<DataState<Joke>, String> {
  final JokeRepository _jokeRepository;

  GetCategoryJoke(this._jokeRepository);

  @override
  Future<DataState<Joke>> call({required String params}) async {
    return _jokeRepository.getCategoryJoke(params);
  }
}
