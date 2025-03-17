part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class OnUserLogin extends AuthEvent {
  final UserModel userModel;

  OnUserLogin({required this.userModel});
}

class OnEmployeeLogin extends AuthEvent {
  final EmpCmpModel empCmpModel;

  OnEmployeeLogin({required this.empCmpModel});
}

class OnCompanyLogin extends AuthEvent {
  final EmpCmpModel empCmpModel;

  OnCompanyLogin({required this.empCmpModel});
}
