part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrdersLoaded extends OrderState {
  final List<OrderDetail> orders;

  OrdersLoaded({required this.orders});
}

final class OrderFailed extends OrderState {}
