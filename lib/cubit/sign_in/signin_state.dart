part of 'signin_cubit.dart';

@immutable
class SigninState {}

class SigninInitial extends SigninState {}
class SigninLoaded extends SigninState {}
class SigninFailure extends SigninState {
  Response? response;

  SigninFailure({required this.response});
}
class SigninSuccess extends SigninState {
  Response? response;
  SigninSuccess({required this.response});

}