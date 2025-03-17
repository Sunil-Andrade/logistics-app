part of 'order_bloc.dart';


sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderPlaced extends OrderState {}

final class OrderFailed extends OrderState {}
