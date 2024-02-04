import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/products/ProductModel.dart';
import '../../Repository/Requests.dart';

part 'single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  SingleProductCubit() : super(SingleProductInitial());
  void SingleProductCheck({required var id}){
    emit(SingleProductLoading());
    Requests().SingleProduct(id: id).then((response) {
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print("Success=$response");
        ProductSuccessModel single_product = ProductSuccessModel.fromJson(response?.data);
        emit(SingleProductSuccess(single_product:single_product));
      }
      else{
        print("Failed=$response");
        emit(SingleProductFailed());
      }
    });
  }
}
