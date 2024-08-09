part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
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
