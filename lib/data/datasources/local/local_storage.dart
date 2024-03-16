import 'package:shared_preferences/shared_preferences.dart';

const cachedJokesListKey = 'CACHED_JOKES';

abstract class LocalStorage {
  Future<void> saveJokes({
    required String list,
  });

  Future<String?> loadJokes();
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;

  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  @override
  Future<String?> loadJokes() async {
    return _sharedPref.getString(cachedJokesListKey);
  }

  @override
  Future<void> saveJokes({required String list}) async {
    _sharedPref.setString(cachedJokesListKey, list);
  }
}
