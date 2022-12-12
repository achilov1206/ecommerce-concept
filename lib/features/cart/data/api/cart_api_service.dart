import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/cart_model.dart';
part 'cart_api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class CartApiService {
  factory CartApiService(Dio dio) => _CartApiService(dio);

  @GET('/53539a72-3c5f-4f30-bbb1-6ca10d42c149')
  Future<Cart> getCart();
}
