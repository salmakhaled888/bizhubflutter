import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  void AddProductCheck({required Map data}){
    emit(AddProductLoading());
    Requests().AddProduct(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print(response?.statusCode);
        emit(AddProductSuccess());
      }
      else{
        print(response);
        emit(AddProductFailed());
      }
    });
  }

}
