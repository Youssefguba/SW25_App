import 'package:dio/dio.dart';
import 'package:ecommerce_app_sw25/models/product_model.dart';

class ProductRepository {
  Future<List<Product>> getAllProducts() async {
    final response = await Dio().get('https://dummyjson.com/products');

   final listOfProductModel = List<Product>.from( response.data['products'].map((value) {
     return Product.fromJson(value);
   }));


    return listOfProductModel;
  }
}
