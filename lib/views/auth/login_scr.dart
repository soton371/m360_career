import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/views/auth/auth_header.dart';
import 'package:m360_career/views/auth/forgot_password_scr.dart';
import 'package:m360_career/views/auth/sign_up_scr.dart';
import 'package:m360_career/views/home/home_scr.dart';
import 'package:page_transition/page_transition.dart';
import '../../configs/configs.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        children: [
          FadeInUp(
            child: const AuthHeader(
                title: "Welcome Here👋",
                subtitle:
                    "Unlock M360ICT job opportunities. Login to get started."),
          ),

          SizedBox(
            height: 80.h,
          ),

          //for email
          FadeInUp(
            child: AppTextField(
                label: 'Email',
                hintText: 'Soton.m360ict@gmail.com',
                textEditingController: TextEditingController()),
          ),
          //end for email


          //for password
          FadeInUp(
            child: AppTextField(
                label: 'Password',
                hintText: '••••••••••',
                textEditingController:
                    TextEditingController()),
          ),
          //end for password

          FadeInUp(
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, PageTransition(child: const ForgotPasswordScreen(), type: PageTransitionType.fade));
                    }, child: const Text("Forgot Password?"))),
          ),

          SizedBox(height: AppSizes.bodyPadding.h * 2),

          FadeInUp(child: ElevatedButton(onPressed: () {
            Navigator.push(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));

          }, child: const Text("LOGIN"))),

          SizedBox(height: AppSizes.bodyPadding.h),

          FadeInUp(
            child: FilledButton.tonalIcon(
                onPressed: () {
                  appLoader(context);
                },
                icon: Image.asset(
                  kGooglePng,
                  height: 14.r,
                ),
                label: const Text('SIGN IN WITH GOOGLE')),
          ),

          SizedBox(height: AppSizes.bodyPadding.h),

          FadeInUp(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  "You don't have an account yet? ",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, PageTransition(child:const SignUpScreen(),type: PageTransitionType.fade));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: AppColors.filledButtonText,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.filledButtonText,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
