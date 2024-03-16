import 'package:equatable/equatable.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';

class SearchJokePageState extends Equatable {
  const SearchJokePageState(
      {this.status = PageStatus.initial, this.errorMsg, required this.jokes});

  final PageStatus status;
  final List<Joke> jokes;
  final String? errorMsg;

  SearchJokePageState copyWith({
    PageStatus? status,
    List<Joke>? jokes,
    String? errorMsg,
  }) {
    return SearchJokePageState(
        status: status ?? this.status,
        jokes: jokes ?? this.jokes,
        errorMsg: errorMsg);
  }

  @override
  List<Object> get props => [
        {errorMsg},
        status,
        jokes
      ];
}
