import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/connectivity_service.dart';
import '../../../data/repositories/cart_repository.dart';
import '../../../../../core/errors/custom_error.dart';
import '../../../../cart/data/model/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  final ConnectivityService _connectivityService;
  late final StreamSubscription? _connectivityStreamSubscription;
  CartBloc(this._cartRepository, this._connectivityService)
      : super(CartLoadingState()) {
    _connectivityStreamSubscription =
        _connectivityService.connectivityStream?.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No internet');
        add(CartNoInternetEvent());
      } else {
        print('Has Internet');
        add(LoadCartEvent());
      }
    });
    on<CartNoInternetEvent>(
      (event, emit) {
        emit(
          CartNoInternetState(),
        );
      },
    );

    on<LoadCartEvent>(
      (event, emit) async {
        try {
          emit(
            CartLoadingState(),
          );
          final cart = await _cartRepository.getCart();
          emit(
            CartLoadedState(
              cart: cart,
            ),
          );
        } catch (e) {
          emit(
            CartLoadingErrorState(
              error: CustomError(
                code: e.toString(),
                message: '',
                plugin: 'CartBloc/LoadCartEvent',
              ),
            ),
          );
        }
      },
    );
  }
  @override
  Future<void> close() async {
    await _connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
