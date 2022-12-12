import 'package:http/http.dart';

import '../api/product_api_service.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductApiService _productApiService;
  ProductRepository(
    this._productApiService,
  );

  Future<Product> getProducts() => _productApiService.getProducts();
}
