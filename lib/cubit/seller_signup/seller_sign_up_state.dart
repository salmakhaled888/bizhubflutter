part of 'seller_sign_up_cubit.dart';

@immutable
abstract class SellerSignUpState {}

class SellerSignUpInitial extends SellerSignUpState {}
class SellerSignUpLoading extends SellerSignUpState {}
class SellerSignUpFailed extends SellerSignUpState {
  Response? response;
  SellerSignUpFailed({required this.response});
}
class SellerSignUpSuccess extends SellerSignUpState {
  Response? response;
  SellerSignUpSuccess({required this.response});
}
