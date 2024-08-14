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

final class MatchOtpSuccess extends AuthState{}

final class MatchOtpFailed extends AuthState{
  final String? title, message;
  const MatchOtpFailed({required this.title, required this.message});
}
//end for match otp
