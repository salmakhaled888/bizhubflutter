part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategoryFailed extends CategoryState {}
class CategorySuccess extends CategoryState {
  List <CategoryModel> categories = [];
  CategorySuccess({required this.categories});
}
