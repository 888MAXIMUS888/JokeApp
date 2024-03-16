import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/data/datasources/remote/app_api_service.dart';
import 'package:joke_app/data/extensions/api_extensions.dart';
import 'package:joke_app/data/mapper/joke_mapper.dart';
import 'package:joke_app/data/mapper/jokes_mapper.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final AppApiService _appApiService;

  JokeRepositoryImpl(this._appApiService);

  @override
  Future<DataState<List<String>>> getAllCategories() async {
    return await doSafeApiCall(() async => await _appApiService.getCategories(),
        (responseData) => responseData);
  }

  @override
  Future<DataState<Joke>> getCategoryJoke(String category) async {
    return await doSafeApiCall(
        () async => await _appApiService.getCategoryJoke(category),
        JokeMapper().mapToEntity);
  }

  @override
  Future<DataState<List<Joke>>> searchJoke(String query) async {
    return await doSafeApiCall(
        () async => await _appApiService.searchJoke(query),
        JokesMapper().mapToEntity);
  }
}
