part of 'add_seller_shop_cubit.dart';

@immutable
abstract class AddSellerShopState {}

class AddSellerShopInitial extends AddSellerShopState {}
class AddSellerShopFailed extends AddSellerShopState {
  Response? response;
  AddSellerShopFailed({required this.response});
}
class AddSellerShopLoading extends AddSellerShopState {}
class AddSellerShopSuccess extends AddSellerShopState {}

