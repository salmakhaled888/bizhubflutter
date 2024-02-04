import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'business_type_state.dart';

class BusinessTypeCubit extends Cubit<BusinessTypeState> {
  BusinessTypeCubit() : super(BusinessTypeInitial());
  void BusinessTypeCheck({required Map data}){
    emit(BusinessTypeLoading());
    Requests().BusinessType(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print(response?.statusCode);
        emit(BusinessTypeSuccess());
      }
      else{
        print(response);
        emit(BusinessTypeFailed());
      }
    });
  }
}
