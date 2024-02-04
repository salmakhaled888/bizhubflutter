part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductFailed extends ProductState {}
class ProductSuccess extends ProductState {
  List <ProductSuccessModel> products = [];
  ProductSuccess({required this.products});
}
