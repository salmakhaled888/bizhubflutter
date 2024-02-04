part of 'single_category_cubit.dart';

@immutable
abstract class SingleCategoryState {}

class SingleCategoryInitial extends SingleCategoryState {}
class SingleCategoryLoading extends SingleCategoryState {}
class SingleCategoryFailed extends SingleCategoryState {}
class SingleCategorySuccess extends SingleCategoryState {
  CategoryModel category;
  SingleCategorySuccess({required this.category});
}


