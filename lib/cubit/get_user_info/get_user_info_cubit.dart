import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());
  void GetSellerCheck({required var search_query, required var seller_id}){
    emit(GetUserInfoLoading());
    Requests().SearchSeller(search_query: search_query).then((response) async {
      if(response?.statusCode == 200 || response?.statusCode == 201) {
        Response shop_info = await Requests().SearchShopCategory(search_query: seller_id) as Response;
        print(response?.statusCode);
        emit(GetUserInfoSuccess());
      }
      else{
        print(response);
        emit(GetUserInfoFailed());
      }
    });
  }
}
