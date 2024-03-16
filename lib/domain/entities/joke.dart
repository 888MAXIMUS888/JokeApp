class Joke {
  static const String _fieldIconUrl = 'icon_url';
  static const String _fieldId = 'id';
  static const String _fieldJoke = 'value';

  final String iconUrl;
  final String id;
  final String joke;

  const Joke({required this.iconUrl, required this.id, required this.joke});

  Map<String, dynamic> toJson() =>
      <String, dynamic>{_fieldIconUrl: iconUrl, _fieldId: id, _fieldJoke: joke};
}
