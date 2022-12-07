import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_sw25/models/category_repo_model.dart';
import 'package:ecommerce_app_sw25/repository/category_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getAllCategories() async {

    try {
      emit(LoadingCategory());

      final categories = await CategoryRepo().getAllCategories();

      emit(GetCategoriesSuccess(categories));
    } on Exception catch (e) {

      emit(ErrorInCategory(e));
    }

  }
}
