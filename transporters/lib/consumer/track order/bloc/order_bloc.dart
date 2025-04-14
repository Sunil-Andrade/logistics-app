import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:transporters/consumer/track%20order/data/fetch_order.dart';
import 'package:transporters/consumer/track%20order/model/order_detail.dart';

part 'order_event.dart';
part 'order_state.dart';

class TOrderBloc extends Bloc<OrderEvent, OrderState> {
  final FetchOrder fetchOrder = FetchOrder();
  TOrderBloc() : super(OrderInitial()) {
    on<GetOrders>(getOrders);
  }

  void getOrders(GetOrders event, Emitter emit) async {
    try {
      print("hit");
      var orders = await fetchOrder.trackOrders(userID: event.userId);
      print(orders);
      emit(OrdersLoaded(orders: orders));
    } catch (e) {
      print(e.toString());
    }
  }
}
