import 'package:dio/dio.dart';
import 'package:joke_app/core/utils/constants.dart';

class BaseHttpClient {
  static Dio createDioHttpClient() {
    final BaseOptions options = BaseOptions(
      baseUrl: BASE_API_URL,
    );

    Dio dio = Dio(options);

    dio.interceptors
      ..clear()
      ..add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
      // ..add(InterceptorsWrapper(onRequest: (request, handler) async {
      //   /// Token must be encrypted
      //   request.headers['x-api-key'] =
      //       'BxWr6VUVph4KszpHX1cCJ2MRXwERAqEj3ZhHRgiH';
      //   return handler.next(request);
      // }));

    return dio;
  }
}
