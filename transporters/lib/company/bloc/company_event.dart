part of 'company_bloc.dart';

@immutable
sealed class CompanyEvent {}

class CGetOrders extends CompanyEvent {}

class CGetPorts extends CompanyEvent {}

class CEmployees extends CompanyEvent {}

class CGetUsers extends CompanyEvent {}
