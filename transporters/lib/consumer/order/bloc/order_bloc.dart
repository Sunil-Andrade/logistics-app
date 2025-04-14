import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:transporters/consumer/order/model/cargo_model.dart';
import 'package:http/http.dart' as http;
import 'package:transporters/consumer/order/model/port_model.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final String baseURl = "http://127.0.0.1:8080";
  OrderBloc() : super(OrderInitial()) {
    on<PlaceOrderE>(onOrder);
  }

  Future<void> onOrder(PlaceOrderE event, Emitter emit) async {
    final url = Uri.parse("$baseURl/orders/placeorder");

    try {
      emit(OrderInitial());

      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": event.cargoModel.cargoName,
            "from": event.cargoModel.from,
            "to": event.cargoModel.to,
            "user_Id": event.cargoModel.userId,
            "del": event.cargoModel.isDel,
          }));

      if (response.statusCode == 201 || response.statusCode == 200) {
        emit(OrderPlaced());
        await Future.delayed(const Duration(seconds: 7));
        emit(OrderInitial());
      } else {
        emit(OrderFailed());
      }
    } catch (e) {
      emit(OrderFailed());
    }
  }
}
