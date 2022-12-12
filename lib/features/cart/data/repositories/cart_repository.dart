import '../api/cart_api_service.dart';
import '../model/cart_model.dart';

class CartRepository {
  final CartApiService _cartApiService;
  CartRepository(
    this._cartApiService,
  );

  Future<Cart> getCart() => _cartApiService.getCart();
}
