import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transporters/company/data/company_remote.dart';
import 'package:transporters/company/model/emp_model.dart';
import 'package:transporters/company/model/ports.dart';
import 'package:transporters/company/model/users_model.dart';

import 'package:transporters/consumer/track%20order/model/order_detail.dart';

part 'company_event.dart';
part 'company_state.dart';

final CompanyRemote companyRemote = CompanyRemote();

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<CGetPorts>(getPorts);
    on<CGetOrders>(getOrders);
    on<CEmployees>(getEmployees);
    on<CGetUsers>(getUsers);
  }

  void getPorts(CGetPorts event, Emitter emit) async {
    try {
      emit(ComLoading());
      final List<Ports> ports = await companyRemote.getPorts();

      emit(CompanyPortsL(ports: ports));
    } catch (e) {
      emit(CompanyFailedL(message: e.toString()));
    }
  }

  void getOrders(CGetOrders event, Emitter emit) async {
    try {
      emit(ComLoading());
      final List<OrderDetail> orders = await companyRemote.getOrders();

      emit(CompanyOrdersL(orderDetails: orders));
    } catch (e) {
      emit(CompanyFailedL(message: e.toString()));
    }
  }

// employees -----
  void getEmployees(CEmployees event, Emitter emit) async {
    try {
      emit(ComLoading());
      final List<EmpModel> employees = await companyRemote.getEmployees();

      emit(CompanyEmplL(employees: employees));
    } catch (e) {
      emit(CompanyFailedL(message: e.toString()));
    }
  }

// users ------
  void getUsers(CGetUsers event, Emitter emit) async {
    try {
      emit(ComLoading());
      final List<UsersModel> users = await companyRemote.getUsers();

      emit(CompanyUsersL(users: users));
    } catch (e) {
      emit(CompanyFailedL(message: e.toString()));
    }
  }
}
