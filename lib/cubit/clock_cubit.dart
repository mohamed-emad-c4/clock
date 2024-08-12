import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clock_state.dart';

class ClockCubit extends Cubit<ClockState> {
  ClockCubit() : super(ClockInitial());
  void seconds() {
    emit(ClockSeconds());
  }

  void minutes() {
    emit(ClockMinutes());
  }

  void hours() {
    emit(ClockHours());
  }
}
