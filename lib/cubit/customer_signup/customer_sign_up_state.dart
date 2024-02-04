part of 'customer_sign_up_cubit.dart';

@immutable
abstract class CustomerSignUpState {}

class CustomerSignUpInitial extends CustomerSignUpState {}
class CustomerSignUpLoading extends CustomerSignUpState {}
class CustomerSignUpFailed extends CustomerSignUpState {
  Response? response;
  CustomerSignUpFailed({required this.response});
}
class CustomerSignUpSuccess extends CustomerSignUpState {
  Response? response;
  CustomerSignUpSuccess({required this.response});
}
