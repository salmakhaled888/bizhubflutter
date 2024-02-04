import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/products/ProductModel.dart';
import '../../Repository/Requests.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());
  void AllProductCheck(){
    emit(AllProductsLoading());
    Requests().Products().then((response) {
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print("Success=$response");
        List <ProductSuccessModel> products =[];
        for (int i = 0; i < response?.data.length; i++){
          products.add(ProductSuccessModel.fromJson(response?.data[i]));
        }
        emit(AllProductsSuccess(products:products));
      }
      else{
        print("Failed=$response");
        emit(AllProductsFailed());
      }
    });
  }
}
