part of 'single_product_cubit.dart';

@immutable
abstract class SingleProductState {}

class SingleProductInitial extends SingleProductState {}
class SingleProductLoading extends SingleProductState {}
class SingleProductFailed extends SingleProductState {}
class SingleProductSuccess extends SingleProductState {
  ProductSuccessModel single_product;
  SingleProductSuccess({required this.single_product});
}
