import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_sw25/models/cart_model.dart';
import 'package:ecommerce_app_sw25/repository/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getMyCart() async {
    emit(LoadingCart());
    final cart = await CartRepo().getMyCart();
    emit(GetMyCartSuccessful(cart));
  }
}
