import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/categories/CategoryModel.dart';
import '../../Repository/Requests.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void CategoriesCheck() {
    emit(CategoryLoading());
    Requests().Categories().then((response) {
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print("Success=$response");
        List <CategoryModel> categories = [];
        for (int i = 0; i < response?.data.length; i++) {
          categories.add(CategoryModel.fromJson(response?.data[i]));
        }
        emit(CategorySuccess(categories: categories));
      }
      else {
        print("Failed=$response");
        emit(CategoryFailed());
      }
    });
  }
}
