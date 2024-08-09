part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

//for send otp
class SendOtpForRegistration extends AuthEvent{
  final Map<String, String> payloadRegistration;
  const SendOtpForRegistration(this.payloadRegistration);
}

class ResendOtp extends AuthEvent{}
//end for send otp



//for match otp
class MatchOtp extends AuthEvent{
  final Map<String, String> otpPayload;
  const MatchOtp(this.otpPayload);
}
//end for match otp