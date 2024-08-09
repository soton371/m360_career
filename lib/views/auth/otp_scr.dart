import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/widgets/widgets.dart';
import 'package:pinput/pinput.dart';

import '../../blocs/blocs.dart';
import '../../configs/configs.dart';
import '../views.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
        OtpTimerCubit()
          ..startTimer(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            logger.d("message state: ${state.runtimeType}");
            if(state is SendOtpLoading){
              appLoader(context);
            }else if(state is SendOtpSuccess){
              Navigator.pop(context);
              Navigator.pop(context);
              context.read<OtpTimerCubit>().resetTimer();
            }else if(state is SendOtpFailed){
              Navigator.pop(context);
              Navigator.pop(context);
              appDialog(context, msg: state.message??'Failed to send otp.',title: state.title);
            }
          },
          child: ListView(
            padding: EdgeInsets.all(AppSizes.bodyPadding.r),
            children: [
              FadeInUp(
                child: const AuthHeader(
                    title: "You've got mail📩",
                    subtitle:
                    "We have sent the OTP verification code to your email address. Check your email and enter the code below."),
              ),
              SizedBox(
                height: 80.h,
              ),
              FadeInUp(
                child: Pinput(
                  onCompleted: (pin) {},
                  cursor: const Text(
                    '|',
                    style: TextStyle(color: AppColors.seed, fontSize: 22),
                  ),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.seed),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              FadeInUp(
                child: const Text(
                  "Didn't received email?",
                  textAlign: TextAlign.center,
                ),
              ),

              FadeInUp(
                child: BlocBuilder<OtpTimerCubit, OtpTimerState>(
                  builder: (context, state) {
                    return state.remainingSeconds == 0 ?
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(ResendOtp());
                        /*final cubit = context.read<OtpTimerCubit>();
                      if (cubit.state.remainingSeconds == 0) {
                        // cubit.resetTimer();
                        // Trigger resend email logic here
                      }*/
                      },
                      child: const Text('Resend Code', style: TextStyle(
                          color: AppColors.seed),),
                    )
                        :
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'You can resend code in ',
                        style: const TextStyle(color: AppColors.black),
                        children: [
                          TextSpan(
                            text: '${state.remainingSeconds}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.seed
                            ),
                          ),
                          const TextSpan(text: ' seconds'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PinTheme defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.title,
  ),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSizes.radius),
      border: Border.all(color: AppColors.shadow),
      boxShadow: AppColors.boxShadow,
      color: AppColors.container
    // border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
  ),
);
