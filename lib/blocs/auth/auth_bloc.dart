import 'package:bloc/bloc.dart';
import 'package:m360_career/configs/configs.dart';
import 'package:m360_career/models/models.dart';
import 'package:m360_career/repositories/post_response.dart';

import '../../utilities/utilities.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Map<String, String>? payloadRegistration;
  Map<String, dynamic>? payloadSendOtp;
  String? token;

  AuthBloc() : super(AuthInitial()) {
    //for SendOtpForRegistration
    on<DoSendOtp>((event, emit) async {
      emit(SendOtpLoading());
      logger.f("Call DoSendOtp");
      try{
        if(event.type == 0){
          payloadRegistration = event.payload;
        }

        payloadSendOtp = {"email": event.payload['email'], "type": event.type};
        final request =
        await postResponse(url: AppUrls.sendOtp, payload: payloadSendOtp);
        final response = appParseJson(
          request,
              (data) => data,
        );
        if (response.success == true) {
          emit(SendOtpSuccess());
        } else {
          emit(SendOtpFailed(title: response.title, message: response.message));
        }
      }catch(e){
        logger.e("message SendOtpForRegistration: $e");
        emit(const SendOtpFailed(title: "Failed!", message: "Something went wrong"));
      }

    });
    //end for SendOtpForRegistration

    //for resend otp
    on<DoResendOtp>((event, emit) async {
      emit(SendOtpLoading());
      logger.f("Call ResendOtp");
      try{
        final request =
        await postResponse(url: AppUrls.sendOtp, payload: payloadSendOtp);
        final response = appParseJson(
          request,
              (data) => data,
        );
        if (response.success == true) {
          emit(SendOtpSuccess());
        } else {
          emit(SendOtpFailed(title: response.title, message: response.message));
        }
      }catch(e){
        logger.e("message ResendOtp: $e");
        emit(const SendOtpFailed(title: "Failed!", message: "Something went wrong"));
      }

    });
    //end for resend otp

    //for registration
    on<DoRegistrationEvent>((event, emit) async {
      emit(RegistrationLoading());
      logger.f("Call RegistrationEvent");
      try{
        final Map<String, String> payLoad = payloadRegistration!;
        payLoad['otp'] = event.pin;

        final request = await postResponse(url: AppUrls.registration, payload: payLoad);
        ApiResponse<UserInfoModel> response = appParseJson<UserInfoModel>(
          request,
              (data) => UserInfoModel.fromJson(data),
        );

        token = response.data?.token;

        if (response.success == true && token != null) {
          emit(RegistrationSuccess(token!));
        } else {
          emit(RegistrationFailed(title: response.title, message: response.message));
        }
      }catch(e){
        emit(const RegistrationFailed(title: "Failed!", message: "Something went wrong"));
      }

    });
    //end for registration

    //for match otp forgot password
    on<DoMatchOtp>((event, emit) async {
      emit(MatchOtpLoading());
      logger.f("Call MatchOtp");
      try{
        final Map<String, String> payLoad = event.otpPayload;
        payLoad['email'] = payloadSendOtp!['email'];
        final request =
        await postResponse(url: AppUrls.matchOtp, payload: payLoad);
        final response = appParseJson(
          request,
              (data) => data,
        );
        if (response.success == true) {
          final matchOtpToken = response.data['token'];
          emit(MatchOtpSuccess(matchOtpToken));
        } else {
          emit(MatchOtpFailed(title: response.title, message: response.message));
        }
      }catch(e){
        emit(const MatchOtpFailed(title: "Sorry!", message: "Something went wrong"));
      }

    });
    //end for match otp forgot password

    //for login
    on<DoLogin>((event, emit)async{
      emit(LoginLoading());
      logger.f("message call DoLogin");
      final req = await postResponse(url: AppUrls.login, payload: {
        "email": event.email.trim(),
        "password": event.password.trim()
      });

      final ApiResponse<UserInfoModel> response = appParseJson(req, (fromJsonT)=>UserInfoModel.fromJson(fromJsonT));

      if(response.success != true){
        emit(LoginFailed(title: response.title, message: response.message));
        return;
      }

      final token = response.data?.token??'';
      if(token.isEmpty){
        emit(const LoginFailed(title: "Sorry!", message: "Access token not found."));
        return;
      }
      emit(LoginSuccess(token));
    });
    //end for login


    //for reset password
    on<DoResetPassword>((event, emit)async{
      emit(ResetPasswordLoading());
      logger.f("message call DoResetPassword");
      final req = await postResponse(url: AppUrls.resetPassword, payload: event.payload);

      final response = appParseJson(req, (fromJsonT)=>fromJsonT);

      if(response.success != true){
        emit(ResetPasswordFailed(title: response.title, message: response.message));
        return;
      }

      emit(ResetPasswordSuccess());
    });
    //end for reset password
  }
}
