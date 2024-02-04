part of 'rating_cubit.dart';

@immutable
abstract class RatingState {}

class RatingInitial extends RatingState {}
class RatingLoading extends RatingState {}
class RatingSuccess extends RatingState {
  List<RatingsModel> ratings = [];
  RatingSuccess({required this.ratings});
}
class RatingFailed extends RatingState {}
