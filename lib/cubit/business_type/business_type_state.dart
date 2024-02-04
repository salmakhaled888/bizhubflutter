part of 'business_type_cubit.dart';

@immutable
abstract class BusinessTypeState {}

class BusinessTypeInitial extends BusinessTypeState {}
class BusinessTypeLoading extends BusinessTypeState {}
class BusinessTypeFailed extends BusinessTypeState {}
class BusinessTypeSuccess extends BusinessTypeState {}


