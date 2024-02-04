part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}
class AddProductLoading extends AddProductState {}
class AddProductFailed extends AddProductState {}
class AddProductSuccess extends AddProductState {}
