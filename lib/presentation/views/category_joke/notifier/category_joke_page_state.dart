import 'package:equatable/equatable.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';

class CategoryJokePageState extends Equatable {
  const CategoryJokePageState(
      {this.status = PageStatus.initial, required this.joke, this.errorMsg});

  final PageStatus status;
  final Joke joke;
  final String? errorMsg;

  CategoryJokePageState copyWith(
      {PageStatus? status, Joke? joke, String? errorMsg}) {
    return CategoryJokePageState(
        status: status ?? this.status,
        joke: joke ?? this.joke,
        errorMsg: errorMsg);
  }

  @override
  List<Object> get props => [
        {errorMsg},
        status,
        joke
      ];
}
