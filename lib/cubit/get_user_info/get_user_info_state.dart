part of 'get_user_info_cubit.dart';

@immutable
abstract class GetUserInfoState {}

class GetUserInfoInitial extends GetUserInfoState {}
class GetUserInfoLoading extends GetUserInfoState {}
class GetUserInfoSuccess extends GetUserInfoState {}
class GetUserInfoFailed extends GetUserInfoState {}
