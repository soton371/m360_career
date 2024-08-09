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
//end for send otp