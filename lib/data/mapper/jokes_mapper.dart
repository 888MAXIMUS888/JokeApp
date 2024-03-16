import 'package:joke_app/core/utils/mapper.dart';
import 'package:joke_app/domain/entities/joke.dart' as JokeEntity;
import '../models/joke.dart';

class JokesMapper implements Mapper<Jokes, List<JokeEntity.Joke>> {
  @override
  Jokes mapFromEntity(List<JokeEntity.Joke> entity) {
    // TODO: implement mapFromEntity
    throw UnimplementedError();
  }

  @override
  List<JokeEntity.Joke> mapToEntity(Jokes model) {
    return model.jokes
        .map((e) => JokeEntity.Joke(
              iconUrl: e.iconUrl,
              id: e.id,
              joke: e.joke,
            ))
        .toList();
  }
}
