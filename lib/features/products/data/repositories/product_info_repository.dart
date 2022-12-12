import '../api/product_api_service.dart';
import '../models/product_info_model.dart';

class ProductInfoRepository {
  final ProductApiService _productApiService;
  ProductInfoRepository(
    this._productApiService,
  );

  Future<ProductInfo> getProductInfo() => _productApiService.getProductInfo();
}
