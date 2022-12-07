part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetCategoriesSuccess extends CategoryState {
  final List<CategoryRepoModel> categoryList;

  GetCategoriesSuccess(this.categoryList);

}

class LoadingCategory extends CategoryState {}

class ErrorInCategory extends CategoryState {
  final Exception error;
  ErrorInCategory(this.error);
}
