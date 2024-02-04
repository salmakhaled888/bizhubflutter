import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'shop_category_state.dart';

class ShopCategoryCubit extends Cubit<ShopCategoryState> {
  ShopCategoryCubit() : super(ShopCategoryInitial());
  void ShopCategoryCheck({required Map data}){
    emit(ShopCategoryLoading());
    Requests().ShopCategory(data: data).then((response){
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print(response?.statusCode);
        emit(ShopCategorySuccess());
      }
      else{
        print(response);
        emit(ShopCategoryFailed());
      }
    });
  }
}
