import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../configs/app_sizes.dart';
import '../../utilities/utilities.dart';
import '../../views/views.dart';
import '../../widgets/widgets.dart';

import '../../routes/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        children: [
          FadeInUp(
              child: const AuthHeader(
                  title: "Forgot Password🔑",
                  subtitle:
                      "Enter your email address to get an OTP code to reset your password.")),
          SizedBox(
            height: 80.h,
          ),
          FadeInUp(
              child: AppTextField(
                label: 'Email',
                hintText: 'Soton.m360ict@gmail.com',
                textEditingController: emailCon,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Enter your email';
                  } else if (!isValidEmail(v.trim())) {
                    return 'Enter valid email';
                  } else {
                    return null;
                  }
                },
              ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        child: ElevatedButton(
            onPressed: () {
              final currentState = formKey.currentState;
              if (currentState != null && currentState.validate()) {

              }
            },
            child: const Text("CONTINUE")),
      ),
    );
  }
}
