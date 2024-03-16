import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/data/datasources/local/local_storage.dart';
import 'package:joke_app/data/datasources/remote/app_api_service.dart';
import 'package:joke_app/data/datasources/remote/http_client.dart';
import 'package:joke_app/data/repositories/joke_repository_impl.dart';
import 'package:joke_app/domain/repositories/joke_repository.dart';
import 'package:joke_app/domain/usecases/get_categories_usecase.dart';
import 'package:joke_app/domain/usecases/get_category_joke_usecase.dart';
import 'package:joke_app/domain/usecases/search_joke_usecase.dart';
import 'package:joke_app/main.dart';

// -----------------------------------------------------------------------------
// Domain
// -----------------------------------------------------------------------------

final getCategoriesProvider = Provider(
  (ref) => GetCategories(
    ref.read(jokeRepositoryProvider),
  ),
);

final getCategoryJokeProvider = Provider(
  (ref) => GetCategoryJoke(
    ref.read(jokeRepositoryProvider),
  ),
);

final searchJokeProvider = Provider(
  (ref) => SearchJoke(
    ref.read(jokeRepositoryProvider),
  ),
);

// -----------------------------------------------------------------------------
// Data
// -----------------------------------------------------------------------------
final dioProvider = Provider<Dio>(
  (ref) => BaseHttpClient.createDioHttpClient(),
);

final apiProvider = Provider<AppApiService>(
  (ref) => AppApiService(
    ref.watch(dioProvider),
  ),
);

final jokeRepositoryProvider = Provider<JokeRepository>(
  (ref) => JokeRepositoryImpl(
    ref.watch(apiProvider),
  ),
);

final localStorageProvider = Provider<LocalStorage>(
  (ref) => LocalStorageImpl(sharedPreferences: sharedPref),
);
