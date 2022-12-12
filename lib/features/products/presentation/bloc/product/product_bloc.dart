import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/services/connectivity_service.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../../../core/errors/custom_error.dart';
import '../../../data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  final ConnectivityService _connectivityService;
  late final StreamSubscription? _connectivityStreamSubscription;
  ProductBloc(this._productRepository, this._connectivityService)
      : super(ProductLoadingState()) {
    _connectivityStreamSubscription =
        _connectivityService.connectivityStream?.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No internet');
        add(ProductNoInternetEvent());
      } else {
        print('Has Internet');
        add(LoadProductEvent());
      }
    });
    on<ProductNoInternetEvent>(
      (event, emit) {
        emit(
          ProductNoInternetState(),
        );
      },
    );
    on<LoadProductEvent>(
      (event, emit) async {
        try {
          emit(
            ProductLoadingState(),
          );
          final product = await _productRepository.getProducts();
          emit(
            ProductLoadedState(
              product: product,
            ),
          );
        } catch (e) {
          emit(
            ProductLoadingErrorState(
              error: CustomError(
                code: e.toString(),
                message: '',
                plugin: 'ProductBloc/LoadProductEvent',
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
