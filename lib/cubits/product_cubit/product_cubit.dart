import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_sw25/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getSingleProduct(int productId) async {
    try {
      emit(LoadingProduct());
      final product = await ProductRepository().getSingleProduct(productId);
      emit(GetProductSuccess(product));
    } on Exception catch (e) {
      emit(GetProductFailed());
    }
  }
}
