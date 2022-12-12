part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

class LoadCartEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartNoInternetEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}
