part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductSuccess extends ProductState {
  final Product product;
  GetProductSuccess(this.product);
}

class GetProductFailed extends ProductState {}

class LoadingProduct extends ProductState {}
