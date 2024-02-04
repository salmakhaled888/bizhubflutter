import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/ratings/RatingsModel.dart';
import '../../Repository/Requests.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());
  void GetRatingsCheck(){
    emit(RatingLoading());
    List <RatingsModel> ratings = [];
    for (int i = 1; i < 6;i++){
      Requests().GetRatings(id: i).then((response) {
        if(response?.statusCode == 200 || response?.statusCode == 201){
          ratings.add(RatingsModel.fromJson(response?.data[0]));
          print(ratings);
        }
        else{
          print("Failed=$response");
          emit(RatingFailed());
        }
      });
    }
    emit(RatingSuccess(ratings: ratings));

  }
}
