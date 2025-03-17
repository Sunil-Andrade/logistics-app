import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getNum(int number) {
    switch (number) {
      case 0:
        emit(HomePageS());
        break;
      case 1:
        emit(ShipNowS());
        break;
      case 2:
        emit(TrackShipS());
        break;
      case 3:
        emit(SettingS());
    }
  }
}
