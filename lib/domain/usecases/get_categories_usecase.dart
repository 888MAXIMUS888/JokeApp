import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/domain/repositories/joke_repository.dart';
import 'package:joke_app/domain/usecases/usecase.dart';

class GetCategories implements UseCase<DataState<List<String>>, NoParams> {
  final JokeRepository _jokeRepository;

  GetCategories(this._jokeRepository);

  @override
  Future<DataState<List<String>>> call({NoParams? params}) async {
    return await _jokeRepository.getAllCategories();
  }
}
