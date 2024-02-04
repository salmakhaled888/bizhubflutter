import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'add_seller_shop_state.dart';

class AddSellerShopCubit extends Cubit<AddSellerShopState> {
  AddSellerShopCubit() : super(AddSellerShopInitial());
  void AddSellerShopCheck({required Map data}){
    emit(AddSellerShopLoading());
    Requests().SellerShop(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print(response?.statusCode);
        emit(AddSellerShopSuccess());
      }
      else{
        print(response?.statusCode);
        emit(AddSellerShopFailed(response: response));
      }
    });
  }
}
