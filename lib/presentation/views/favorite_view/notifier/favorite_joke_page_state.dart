import 'package:equatable/equatable.dart';
import 'package:joke_app/domain/entities/joke.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';

class FavoriteJokesPageState extends Equatable {
  const FavoriteJokesPageState(
      {this.status = PageStatus.initial, required this.jokes, this.errorMsg});

  final PageStatus status;
  final List<Joke> jokes;
  final String? errorMsg;

  FavoriteJokesPageState copyWith({
    PageStatus? status,
    List<Joke>? jokes,
    final String? errorMsg,
  }) {
    return FavoriteJokesPageState(
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
