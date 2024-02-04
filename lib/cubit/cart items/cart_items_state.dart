part of 'cart_items_cubit.dart';

@immutable
abstract class CartItemsState {}

class CartItemsInitial extends CartItemsState {}
class CartItemsLoading extends CartItemsState {}
class CartItemsFailed extends CartItemsState {}
class CartItemsSuccess extends CartItemsState {
  List <CartItemsModel> cart_items=[];
  CartItemsSuccess({required this.cart_items});
}
