part of 'order_bloc.dart';

sealed class OrderEvent {}



class PlaceOrderE extends OrderEvent {
  final CargoModel cargoModel;

  PlaceOrderE({required this.cargoModel});
}
