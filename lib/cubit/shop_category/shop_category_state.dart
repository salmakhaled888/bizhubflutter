part of 'shop_category_cubit.dart';

@immutable
abstract class ShopCategoryState {}

class ShopCategoryInitial extends ShopCategoryState {}
class ShopCategoryLoading extends ShopCategoryState {}
class ShopCategoryFailed extends ShopCategoryState {}
class ShopCategorySuccess extends ShopCategoryState {}

