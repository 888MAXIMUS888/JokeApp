import 'package:equatable/equatable.dart';

enum PageStatus { initial, loading, success, failure }

class CategoryPageState extends Equatable {
  const CategoryPageState(
      {this.status = PageStatus.initial,
      this.categories = const [],
      this.errorMsg});

  final PageStatus status;
  final List<String> categories;
  final String? errorMsg;

  CategoryPageState copyWith({
    PageStatus? status,
    List<String>? categories,
    String? errorMsg,
  }) {
    return CategoryPageState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
        errorMsg: errorMsg);
  }

  @override
  List<Object> get props => [
        {errorMsg},
        status,
        categories,
      ];
}
