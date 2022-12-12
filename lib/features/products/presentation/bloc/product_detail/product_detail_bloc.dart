import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product_info_model.dart';
import '../../../data/repositories/product_info_repository.dart';
import '../../../../../core/errors/custom_error.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductInfoRepository _productInfoRepository;
  ProductDetailBloc(this._productInfoRepository)
      : super(ProductDetailLoadingState()) {
    on<LoadProductDetailEvent>((event, emit) async {
      try {
        emit(
          ProductDetailLoadingState(),
        );
        final productDetail = await _productInfoRepository.getProductInfo();
        emit(
          ProductDetailLoadedState(
            productDetail: productDetail,
          ),
        );
      } catch (e) {
        emit(
          ProductDetailLoadingErrorState(
            error: CustomError(
              code: e.toString(),
              message: '',
              plugin: 'ProductDetailBloc/LoadProductDetailEvent',
            ),
          ),
        );
      }
    });
  }
}
