import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/views/auth/reset_password_scr.dart';
import 'package:m360_career/views/home/home_scr.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';
import '../views.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
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
              onCompleted: (pin) {
                logger.i("message pin: $pin");

                if(pin != '5555'){
                  appDialog(context,
                      title: "Sorry!",
                      msg: "You '$pin' code does not match.",
                  );
                  return;
                }

                if(type == 1){
                  Navigator.push(
                      context,
                      PageTransition(
                          child:const ResetPasswordScreen(),
                          type: PageTransitionType.fade));
                }else{
                  appDialog(context,
                      title: "Welcome!",
                      msg: "You have successfully created a new account.",
                      isSuccess: true,
                      actions: [
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                              onPressed: (){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                        child: const HomeScreen(),
                                        type: PageTransitionType.fade),
                                        (v) => true);
                              }, child: const Text("Go to Home")),
                        )
                      ]
                  );
                }

              },
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
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'You can resend code in',
                    style: TextStyle(color: AppColors.title),
                    children: [
                      TextSpan(
                          text: ' 55',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.seed)),
                      TextSpan(text: 's')
                    ])),
          ),
        ],
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
