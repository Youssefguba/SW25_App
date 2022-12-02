import 'package:dio/dio.dart';
import 'package:ecommerce_app_sw25/models/category_repo_model.dart';

class CategoryRepo {

  Future<List<CategoryRepoModel>> getAllCategories() async {
    final response =
        await Dio().get('https://mocki.io/v1/e5775744-06ba-4306-b6f6-93055de3c2d5');

    print('response data ${response.data}');
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
    print('list of categories ${listOfCategories}');


    return listOfCategories;
  }
}