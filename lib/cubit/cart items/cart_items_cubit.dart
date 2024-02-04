import 'package:bloc/bloc.dart';
import 'package:helloworld/Models/cart%20items/CartItemsModel.dart';
import 'package:meta/meta.dart';

import '../../Repository/Requests.dart';

part 'cart_items_state.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  CartItemsCubit() : super(CartItemsInitial());
  void GetCartItemsCheck({required var search_query}){
    emit(CartItemsLoading());
    Requests().GetCartItems(search_query: search_query).then((response) {
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print("Success=$response");
        List <CartItemsModel> cart_items =[];
        for (int i = 0; i < response?.data.length; i++){
          cart_items.add(CartItemsModel.fromJson(response?.data[i]));
        }
        emit(CartItemsSuccess(cart_items: cart_items));
      }
      else{
        print("Failed=$response");
        emit(CartItemsFailed());
      }
    });
  }
}
