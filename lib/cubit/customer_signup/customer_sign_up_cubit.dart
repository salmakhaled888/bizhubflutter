import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'customer_sign_up_state.dart';

class CustomerSignUpCubit extends Cubit<CustomerSignUpState> {
  CustomerSignUpCubit() : super(CustomerSignUpInitial());
  void CustomerRegisterCheck({required Map data}){
    emit(CustomerSignUpLoading());
    Requests().CustomerRegister(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print(response?.statusCode);
        emit(CustomerSignUpSuccess(response: response));
      }
      else{
        print(response?.statusCode);
        emit(CustomerSignUpFailed(response: response));
      }
    });
  }
}
