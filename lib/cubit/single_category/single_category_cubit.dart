import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/categories/CategoryModel.dart';
import '../../Repository/Requests.dart';

part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit() : super(SingleCategoryInitial());

  void SingleCategoryCheck({required var id}) {
    emit(SingleCategoryLoading());
    Requests().SingleCategory(id: id).then((response) {
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print("Success=$response");
        CategoryModel category = CategoryModel.fromJson(response?.data);
        emit(SingleCategorySuccess(category: category));
      }
      else {
        print("Failed=$response");
        emit(SingleCategoryFailed());
      }
    });
  }
}
