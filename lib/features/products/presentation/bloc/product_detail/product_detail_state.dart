part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailLoadedState extends ProductDetailState {
  final ProductInfo productDetail;
  const ProductDetailLoadedState({
    required this.productDetail,
  });
  @override
  List<Object> get props => [productDetail];
}

class ProductDetailLoadingErrorState extends ProductDetailState {
  final CustomError error;
  const ProductDetailLoadingErrorState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class ProductDetailNoInternetState extends ProductDetailState {}
