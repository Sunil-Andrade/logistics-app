import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SidebarCubit extends Cubit<int> {
  SidebarCubit() : super(0);

  void getIndex(int index) {
    emit(index);
  }
}
