import 'package:joke_app/core/utils/mapper.dart';
import 'package:joke_app/data/models/joke.dart';
import 'package:joke_app/domain/entities/joke.dart' as JokeEntity;

class JokeMapper implements Mapper<Joke, JokeEntity.Joke> {
  @override
  Joke mapFromEntity(JokeEntity.Joke entity) {
    // TODO: implement mapFromEntity
    throw UnimplementedError();
  }

  @override
  JokeEntity.Joke mapToEntity(Joke model) {
    return JokeEntity.Joke(
      iconUrl: model.iconUrl,
      id: model.id,
      joke: model.joke,
    );
  }
}
