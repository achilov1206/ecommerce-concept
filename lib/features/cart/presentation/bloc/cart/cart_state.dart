// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  final Cart cart;
  CartLoadedState({
    required this.cart,
  });
  @override
  List<Object?> get props => [cart];
}

class CartLoadingErrorState extends CartState {
  final CustomError error;
  CartLoadingErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}

class CartNoInternetState extends CartState {
  @override
  List<Object?> get props => [];
}
