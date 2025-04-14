part of 'order_bloc.dart';

sealed class OrderState {}

final class PortsLoaded extends OrderState {
  final List<PortModel> ports;

  PortsLoaded({required this.ports});
}

final class OrderLoading extends OrderState {}

final class OrderInitial extends OrderState {}

final class OrderPlaced extends OrderState {}

final class OrderFailed extends OrderState {}

