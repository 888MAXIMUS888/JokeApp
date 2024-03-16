import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/joke.dart';

part 'app_api_service.g.dart';

@RestApi()
abstract class AppApiService {
  factory AppApiService(Dio dio) = _AppApiService;

  @GET('/categories')
  Future<HttpResponse<List<String>>> getCategories();

  @GET('/random')
  Future<HttpResponse<Joke>> getCategoryJoke(
    @Query("category") String category,
  );

  @GET('/search')
  Future<HttpResponse<Jokes>> searchJoke(
    @Query("query") String query,
  );

  // @POST('/checkout')
  // Future<HttpResponse<CheckoutBasket>> addProduct(
  //     @Body() List<SelectedProductRequest> selectedProductRequest);
}
