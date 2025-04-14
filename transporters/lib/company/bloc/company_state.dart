part of 'company_bloc.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyOrdersL extends CompanyState {
  final List<OrderDetail> orderDetails;

  CompanyOrdersL({required this.orderDetails});
}

final class CompanyEmplL extends CompanyState {
  final List<EmpModel> employees;

  CompanyEmplL({required this.employees});
}

final class CompanyUsersL extends CompanyState {
  final List<UsersModel> users;

  CompanyUsersL({required this.users});
}

final class CompanyPortsL extends CompanyState {
  final List<Ports> ports;

  CompanyPortsL({required this.ports});
}

final class ComLoading extends CompanyState {}

final class CompanyFailedL extends CompanyState {
  final String message;

  CompanyFailedL({required this.message});
}
