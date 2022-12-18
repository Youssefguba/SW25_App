part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetMyCartSuccessful extends CartState {
  final CartModel cart;

  GetMyCartSuccessful(this.cart);
}

class LoadingCart extends CartState {}

class FailedCart extends CartState {}
