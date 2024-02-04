import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../Repository/Requests.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  void LoginAuthentication({required Map data}) {
    emit(SigninLoaded());
    print("Loading");
    Requests().LoginRequest(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print("Success=$response");
        emit(SigninSuccess(response: response));
      }
      else{
        print("Failed=$response");
        emit(SigninFailure(response: response));
      }
    });
  }
}
