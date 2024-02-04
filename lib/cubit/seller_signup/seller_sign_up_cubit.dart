import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:helloworld/Repository/Requests.dart';
import 'package:meta/meta.dart';

part 'seller_sign_up_state.dart';

class SellerSignUpCubit extends Cubit<SellerSignUpState> {
  SellerSignUpCubit() : super(SellerSignUpInitial());
  void SellerRegisterCheck({required Map data}){
    emit(SellerSignUpLoading());
    Requests().SellerRegister(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print(response?.statusCode);
        emit(SellerSignUpSuccess(response: response));
      }
      else{
        print(response?.statusCode);
        emit(SellerSignUpFailed(response: response));
      }
    });
  }
}
