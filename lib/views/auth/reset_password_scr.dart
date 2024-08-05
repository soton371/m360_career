import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/configs/app_sizes.dart';
import 'package:m360_career/views/home/home_scr.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/widgets.dart';
import '../views.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        children: [
          FadeInUp(
            child: const AuthHeader(
                title: "Create Password🔐",
                subtitle:
                    "Save the new password in a safe place, if you forgot it then you have to do a forgot password again."),
          ),

          SizedBox(
            height: 80.h,
          ),

          FadeInUp(
            child: AppTextField(
                label: 'Create a new password',
                hintText: '••••••••••',
                textEditingController: TextEditingController()),
          ),

          FadeInUp(
            child: AppTextField(
                label: 'Confirm a new password',
                hintText: '••••••••••',
                textEditingController: TextEditingController()),
          ),

        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        child: ElevatedButton(
            onPressed: () {
              appDialog(context,
                  title: "Welcome Back!",
                  msg: "You have successfully reset and created a new password.",
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

            },
            child: const Text("CONTINUE")),
      ),

    );
  }
}
