import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:m360_career/configs/configs.dart';
import 'package:m360_career/repositories/post_response.dart';

import '../../utilities/utilities.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Map<String, String>? payloadRegistration;

  AuthBloc() : super(AuthInitial()) {
    //for SendOtpForRegistration
    on<SendOtpForRegistration>((event, emit) async {
      emit(SendOtpLoading());
      logger.f("Call SendOtpForRegistration");
      payloadRegistration = event.payloadRegistration;
      final payload = {"email": event.payloadRegistration['email'], "type": 0};
      final request =
          await postResponse(url: AppUrls.sendOtp, payload: payload);
      final response = appParseJson(
        request,
        (data) => data,
      );
      if (response.success == true) {
        emit(SendOtpSuccess());
      } else {
        emit(SendOtpFailed(title: response.title, message: response.message));
      }
    });
    //end for SendOtpForRegistration
  }
}
