part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

//for Send Otp For Registration
class DoSendOtp extends AuthEvent{
  final Map<String, String> payload;
  final int type;
  const DoSendOtp(this.payload,this.type);
}

class DoResendOtp extends AuthEvent{}
//end for Send Otp For Registration

//for registration
class DoRegistrationEvent extends AuthEvent{
  final String pin;
  const DoRegistrationEvent(this.pin);
}
//end for registration

//for match otp
class DoMatchOtp extends AuthEvent{
  final String otp;
  const DoMatchOtp(this.otp);
}
//end for match otp

//for login
class DoLogin extends AuthEvent{
  final String email, password;
  const DoLogin(this.email,this.password);
}
//end login


//for reset password
class DoResetPassword extends AuthEvent{
  final Map<String,String> payload;
  const DoResetPassword(this.payload);
}
//end for reset password