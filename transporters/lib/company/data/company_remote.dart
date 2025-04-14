import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:transporters/company/model/emp_model.dart';
import 'package:transporters/company/model/ports.dart';
import 'package:transporters/company/model/users_model.dart';

import 'package:transporters/consumer/track%20order/model/order_detail.dart';

class CompanyRemote {
  final String baseUrl = "http://127.0.0.1:8080";

  //orders
  Future<List<OrderDetail>> getOrders() async {
    final url = Uri.parse("$baseUrl/cmp/getorders");

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
                  from: order['from'],
                  to: order['to'],
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

  //emplys
  Future<List<EmpModel>> getEmployees() async {
    final url = Uri.parse("$baseUrl/cmp/getemp");
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> resBody = await jsonDecode(response.body);

        final List<dynamic> employees = resBody['employees'];

        return employees
            .map((emp) => EmpModel(
                  id: emp['id'],
                  emial: emp['email'],
                  name: emp['name'],
                ))
            .toList();
      } else {
        throw Exception("Request failed");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //getPorts
  Future<List<Ports>> getPorts() async {
    final url = Uri.parse("$baseUrl/cmp/getports");
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final Map<String, dynamic> resBody = await jsonDecode(response.body);

        final List<dynamic> ports = resBody['ports'];

        return ports
            .map((port) => Ports(
                  id: port['id'],
                  name: port['name'],
                  capacity: port['capacity'],
                  location: port['location'],
                ))
            .toList();
      } else {
        throw Exception("Request failed");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //users
  Future<List<UsersModel>> getUsers() async {
    final url = Uri.parse("$baseUrl/cmp/users");
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> resBody = await jsonDecode(response.body);

        final List<dynamic> users = resBody['users'];

        return users
            .map((user) => UsersModel(
                  userId: user['id'],
                  name: user['name'],
                  email: user['email'],
                ))
            .toList();
      } else {
        throw Exception("Request failed");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
