import 'package:dio/dio.dart';

abstract class DataState<T> {
  const DataState();
}

class DataSuccess<T> extends DataState<T> {
  final T data;

  const DataSuccess(this.data) : super();
}

class DataFailed<T> extends DataState<T> {
  final DioException? error;
  final String errorMsg;

  const DataFailed(this.errorMsg, {this.error}) : super();
}
