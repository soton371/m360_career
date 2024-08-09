part of 'otp_timer_cubit.dart';


class OtpTimerState extends Equatable {
  final int remainingSeconds;

  const OtpTimerState(this.remainingSeconds);

  @override
  List<Object?> get props => [remainingSeconds];
}