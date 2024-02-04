import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'add_cart_items_state.dart';

class AddCartItemsCubit extends Cubit<AddCartItemsState> {
  AddCartItemsCubit() : super(AddCartItemsInitial());
  void AddCartItemsCheck({required Map data}) {
    emit(AddCartItemsLoading());
    print("Loading");
    Requests().AddCartItems(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print("Success=$response");
        emit(AddCartItemsSuccess());
      }
      else{
        print("Failed=$response");
        emit(AddCartItemsFailed());
      }
    });
  }
}
