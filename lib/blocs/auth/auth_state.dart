part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

//for send otp
final class SendOtpLoading extends AuthState {}

final class SendOtpSuccess extends AuthState {}

final class SendOtpFailed extends AuthState {
  final String? title, message;
  const SendOtpFailed({required this.title, required this.message});
}
//end for send otp


//for registration
final class RegistrationLoading extends AuthState{}

final class RegistrationSuccess extends AuthState{
  final String token;
  const RegistrationSuccess(this.token);
}

final class RegistrationFailed extends AuthState{
  final String? title, message;
  const RegistrationFailed({required this.title, required this.message});
}
//end for registration


//for match otp
final class MatchOtpLoading extends AuthState{}

final class MatchOtpSuccess extends AuthState{
  final String token;
  const MatchOtpSuccess(this.token);
}

final class MatchOtpFailed extends AuthState{
  final String? title, message;
  const MatchOtpFailed({required this.title, required this.message});
}
//end for match otp


//for login
final class LoginLoading extends AuthState{}

final class LoginSuccess extends AuthState{
  final String token;
  const LoginSuccess(this.token);
}

final class LoginFailed extends AuthState{
  final String? title, message;
  const LoginFailed({required this.title, required this.message});
}
//end for login

//for rest password
final class ResetPasswordLoading extends AuthState{}

final class ResetPasswordSuccess extends AuthState{
}

final class ResetPasswordFailed extends AuthState{
  final String? title, message;
  const ResetPasswordFailed({required this.title, required this.message});
}
//end for rest password
