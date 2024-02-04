import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void RegisterCheck({required Map data,required var confirm_password}){
    emit(SignupLoaded());
    print("Loading");
    if (data['password'] == confirm_password){
      Requests().RegisterRequest(data: data).then((response) async{
        if(response?.statusCode == 200 ||  response?.statusCode == 201){
          print("Success=${response?.statusCode}");
          emit(SignupSuccess(response: response));
        }
        else{
          print("Failed=${response?.statusCode}");
          emit(SignupFailure(message: response?.statusMessage));
        }
      });
    }
    else{
      emit(SignupFailure(message: "Password and Confirm Password Do not Match"));
    }
  }

}
