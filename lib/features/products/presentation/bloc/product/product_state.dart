part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final Product product;
  const ProductLoadedState({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}

class ProductLoadingErrorState extends ProductState {
  final CustomError error;
  const ProductLoadingErrorState({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

class ProductNoInternetState extends ProductState {}
