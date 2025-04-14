import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transporters/consumer/track%20order/model/order_detail.dart';

class FetchOrder {
  final String baseURl = "http://127.0.0.1:8080";
  Future<List<OrderDetail>> trackOrders({required int userID}) async {
    final url = Uri.parse("$baseURl/orders/getorders?userID=$userID");

    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> resbody = await jsonDecode(response.body);

        final List<dynamic> orderJson = resbody['orders'];
        final List<OrderDetail> list = orderJson
            .map((order) => OrderDetail(
                  id: order['id'],
                  name: order['name'],
                  to: order['to'],
                  from: order['from'],
                  isDel: order['del'],
                ))
            .toList();
        return list;
      } else {
        throw Exception("I dont");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
