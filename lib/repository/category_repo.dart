import 'package:dio/dio.dart';
import 'package:ecommerce_app_sw25/models/category_repo_model.dart';

class CategoryRepo {

  Future<List<CategoryRepoModel>> getAllCategories() async {
    final response =
        await Dio().get('https://api.escuelajs.co/api/v1/categories/');

    final List<CategoryRepoModel> listOfCategories = List<CategoryRepoModel>.from(
      response.data.map(
        (element) {
          // element is Map
          return CategoryRepoModel(
            id: element['id'],
            name: element['name'],
            image: element['image'],
          );
        },
      ),
    );

    return listOfCategories;
  }
}