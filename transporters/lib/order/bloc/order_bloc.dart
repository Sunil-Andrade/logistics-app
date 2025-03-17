import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:transporters/order/model/cargo_model.dart';
import 'package:http/http.dart' as http;
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final String baseURl = "http://127.0.0.1:8080";
  OrderBloc() : super(OrderInitial()) {
    on<PlaceOrderE>(onOrder);
  }

  Future<void> onOrder(PlaceOrderE event, Emitter emit) async {
    final url = Uri.parse("$baseURl/users/create");

    try {
      emit(OrderInitial());
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": event.cargoModel.cargoName,
            "to": event.cargoModel.to,
            "from": event.cargoModel.from,
            "userId": event.cargoModel.userId,
          }));

      if (response.statusCode == 201 || response.statusCode == 200) {
        emit(OrderPlaced());
      } else {
        emit(OrderFailed());
      }
    } catch (e) {
      emit(OrderFailed());
    }
  }
}
