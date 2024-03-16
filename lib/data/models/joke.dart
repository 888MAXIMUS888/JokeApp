class Jokes {
  static const String _fieldTotal = 'total';
  static const String _fieldJokes = 'result';

  final int total;
  final List<Joke> jokes;

  const Jokes({required this.total, required this.jokes});

  factory Jokes.fromJson(Map<String, dynamic> json) {
    return Jokes(
      total: json[_fieldTotal],
      jokes: (json[_fieldJokes] as List).map((e) => Joke.fromJson(e)).toList(),
    );
  }
}

class Joke {
  static const String _fieldIconUrl = 'icon_url';
  static const String _fieldId = 'id';
  static const String _fieldJoke = 'value';

  final String iconUrl;
  final String id;
  final String joke;

  const Joke({required this.iconUrl, required this.id, required this.joke});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      iconUrl: json[_fieldIconUrl],
      id: json[_fieldId],
      joke: json[_fieldJoke],
    );
  }
}
