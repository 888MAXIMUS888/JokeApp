import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:joke_app/core/data_state.dart';
import 'package:joke_app/core/utils/constants.dart';
import 'package:joke_app/data/models/error_response.dart';
import 'package:retrofit/dio.dart';

extension HttpResponseUtils on HttpResponse {
  DataFailed<T> formatErrorFromResponse<T>() {
    return DataFailed<T>(
      response.statusMessage ?? '',
      error: DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
        type: DioExceptionType.badResponse,
      ),
    );
  }
}

extension ResponseUtils on Response {
  bool isSuccessful() {
    return 200 <= statusCode! && statusCode! < 300;
  }
}

extension DioErrorX on DioException {
  bool get isInternetConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }
}

Future<DataState<ReturnType>> doSafeApiCall<ReturnType, ResponseType>(
    Future<HttpResponse<ResponseType>> Function() apiCall,
    ReturnType Function(ResponseType responseData) mapResponse,
    {Function(ResponseType responseData)? extraSuccessAction}) async {
  try {
    final response = await apiCall();
    if (response.response.isSuccessful()) {
      if (extraSuccessAction != null) extraSuccessAction(response.data);

      return DataSuccess(mapResponse(response.data));
    }
    return response.formatErrorFromResponse();
  } on DioException catch (e) {
    if (e.response?.data != null && e.response!.data.toString().isNotEmpty) {
      var errorJson;
      if (e.response?.data is String) {
        errorJson = json.decode(e.response!.data);
      } else {
        errorJson = e.response?.data;
      }
      return DataFailed(ErrorResponse.fromJson(errorJson).error.toString(),
          error: e);
    } else {
      if (e.isInternetConnectionError) {
        return const DataFailed(noInternetConnection);
      } else {
        return DataFailed(e.message ?? '', error: e);
      }
    }
  } catch (e) {
    return DataFailed(e.toString());
  }
}
