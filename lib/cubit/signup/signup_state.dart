part of 'signup_cubit.dart';

@immutable
class SignupState {}

class SignupInitial extends SignupState {}
class SignupLoaded extends SignupState {}
class SignupFailure extends SignupState {

  String? message;

  SignupFailure({required this.message});
}
class SignupSuccess extends SignupState{
  Response? response;

  SignupSuccess({required this.response});
}