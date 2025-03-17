part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class HomePageS extends UserState {}

final class ShipNowS extends UserState {}

final class TrackShipS extends UserState {}

final class SettingS extends UserState {}
