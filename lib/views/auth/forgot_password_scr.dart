import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/configs/app_sizes.dart';
import 'package:m360_career/views/views.dart';
import 'package:m360_career/widgets/widgets.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        children: [
          FadeInUp(child: const AuthHeader(title: "Forgot Password🔑", subtitle: "Enter your email address to get an OTP code to reset your password."))
          ,SizedBox(
            height: 80.h,
          ),
          FadeInUp(child: AppTextField(label: 'Email', hintText: 'Soton.m360ict@gmail.com', textEditingController: TextEditingController()))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, PageTransition(child: const OtpScreen(type: 1,), type: PageTransitionType.fade));
        }, child: const Text("CONTINUE")),
      ),
    );
  }
}
