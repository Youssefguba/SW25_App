import 'package:dio/dio.dart';
import 'package:ecommerce_app_sw25/models/cart_model.dart';

class CartRepo {

  Future<CartModel> getMyCart() async {
    final response = await Dio().get('https://dummyjson.com/carts/1');

    final cart = CartModel.fromJson(response.data);

    return cart;
  }

}