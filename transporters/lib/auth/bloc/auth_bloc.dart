import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:transporters/auth/model/emp_cmp_model.dart';
import 'package:transporters/auth/model/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final String baseURl = "http://127.0.0.1:8080";

  AuthBloc() : super(AuthInitial()) {
    on<OnUserLogin>(userLogin);
    on<OnEmployeeLogin>(onEmployLogin);
    on<OnCompanyLogin>(onCompanyLogin);
  }

  Future<void> userLogin(OnUserLogin event, Emitter emit) async {
    final url = Uri.parse("$baseURl/users/create");

    try {
      emit(AuthLoading());
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": event.userModel.name,
            "email": event.userModel.email,
            "password": event.userModel.password,
            "address": event.userModel.address,
          }));

      if (response.statusCode == 201 || response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        final userId = resBody['id'];

        emit(AuthSuccess(id: userId));
      } else {
        emit(AuthFailure(message: "Failed to Sign In ${response.body}"));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> onEmployLogin(OnEmployeeLogin event, Emitter emit) async {
    final url = Uri.parse("$baseURl/employee/login");
    try {
      emit(AuthLoading());
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "who": event.empCmpModel.who,
            "email": event.empCmpModel.email,
            "password": event.empCmpModel.password
          }));
      if (response.statusCode == 201 || response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        final userId = resBody["id"];
        emit(AuthSuccess(id: userId));
      } else {
        emit(AuthFailure(message: "Failed to Sign In ${response.body}"));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> onCompanyLogin(OnCompanyLogin event, Emitter emit) async {
    final url = Uri.parse("$baseURl/company/login");
    try {
      emit(AuthLoading());
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "who": event.empCmpModel.who,
            "email": event.empCmpModel.email,
            "password": event.empCmpModel.password
          }));
      if (response.statusCode == 201 || response.statusCode == 200) {
        final resBody = jsonDecode(response.body);
        final userId = resBody["id"];
        emit(AuthSuccess(
          id: userId,
        ));
      } else {
        emit(AuthFailure(message: "Failed to Sign In ${response.body}"));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
