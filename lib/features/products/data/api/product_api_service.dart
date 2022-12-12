import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/product_info_model.dart';
import '../models/product_model.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ProductApiService {
  factory ProductApiService(Dio dio) => _ProductApiService(dio);

  @GET('/6c14c560-15c6-4248-b9d2-b4508df7d4f5')
  Future<ProductInfo> getProductInfo();

  @GET('/654bd15e-b121-49ba-a588-960956b15175')
  Future<Product> getProducts();
}
