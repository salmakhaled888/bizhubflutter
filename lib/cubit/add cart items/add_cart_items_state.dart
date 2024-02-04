part of 'add_cart_items_cubit.dart';

@immutable
abstract class AddCartItemsState {}

class AddCartItemsInitial extends AddCartItemsState {}
class AddCartItemsLoading extends AddCartItemsState {}
class AddCartItemsFailed extends AddCartItemsState {}
class AddCartItemsSuccess extends AddCartItemsState {}
