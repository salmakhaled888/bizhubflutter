import 'package:bloc/bloc.dart';
import 'package:helloworld/Repository/Requests.dart';
import 'package:meta/meta.dart';
import '../../Models/products/ProductModel.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  void SearchProductCheck({required var search_query}){
    emit(ProductLoading());
    Requests().ProductSearch(search_query: search_query).then((response) {
      if(response?.statusCode == 200 || response?.statusCode == 201){
        print("Success=$response");
        List <ProductSuccessModel> products =[];
        for (int i = 0; i < response?.data.length; i++){
          products.add(ProductSuccessModel.fromJson(response?.data[i]));
        }
        emit(ProductSuccess(products:products));
      }
      else{
        print("Failed=$response");
        emit(ProductFailed());
      }
    });
  }
}
