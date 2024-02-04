part of 'all_products_cubit.dart';

@immutable
abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}
class AllProductsFailed extends AllProductsState {}
class AllProductsLoading extends AllProductsState {}
class AllProductsSuccess extends AllProductsState {
  List <ProductSuccessModel> products = [];
  AllProductsSuccess({required this.products});
}
