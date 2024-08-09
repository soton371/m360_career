import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_timer_state.dart';



class OtpTimerCubit extends Cubit<OtpTimerState> {
  static const int _initialTime = 120;
  Timer? _timer;

  OtpTimerCubit() : super(const OtpTimerState(_initialTime));

  void startTimer() {
    _timer?.cancel();  // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        emit(OtpTimerState(state.remainingSeconds - 1));
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    emit(const OtpTimerState(_initialTime));
    startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

