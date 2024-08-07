import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:m360_career/views/auth/otp_scr.dart';
import '../../configs/configs.dart';
import '../../views/auth/auth_header.dart';
import '../../views/auth/login_scr.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        children: [
          FadeInUp(
            child: const AuthHeader(
                title: "Create an account✏️",
                subtitle:
                    "Please complete your profile. Don't worry, your data will remain private and only you can see it."),
          ),
          SizedBox(
            height: AppSizes.bodyPadding.h*2,
          ),
          //for name
          FadeInUp(
            child: AppTextField(
                label: 'Full Name',
                hintText: 'Soton Ahmed',
                textEditingController: TextEditingController()),
          ),
          //end for name

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
            child: ValueListenableBuilder(
                valueListenable: pass1Hide,
              builder: (context, value, _) {
                return AppTextField(
                    label: 'Password',
                    hintText: '•••••••••••',
                    obscureText: value,
                    suffixIcon: InkWell(
                      onTap: (){
                        pass1Hide.value = !value;
                      },
                      child: HugeIcon(
                        icon: value ? HugeIcons.strokeRoundedViewOff : HugeIcons.strokeRoundedView,
                        color: AppColors.hint,
                      ),
                    ),
                    textEditingController:
                    TextEditingController());
              }
            ),
          ),
          //end for password

          //for password
          FadeInUp(
            child: ValueListenableBuilder(
                valueListenable: pass2Hide,
              builder: (context, value, _) {
                return AppTextField(
                    label: 'Re-Password',
                    hintText: '••••••••••••',
                    obscureText: value,
                    suffixIcon: InkWell(
                      onTap: (){
                        pass2Hide.value = !value;
                      },
                      child: HugeIcon(
                        icon: value ? HugeIcons.strokeRoundedViewOff : HugeIcons.strokeRoundedView,
                        color: AppColors.hint,
                      ),
                    ),
                    textEditingController:
                    TextEditingController());
              }
            ),
          ),
          //end for password

          SizedBox(height: 80.h,),

          FadeInUp(child: ElevatedButton(onPressed: () {
            Navigator.push(context, PageTransition(child:const OtpScreen(type: 0,),type: PageTransitionType.fade));

          }, child: const Text("SIGN UP"))),

          SizedBox(height: AppSizes.bodyPadding.h),

          FadeInUp(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, PageTransition(child:const LoginScreen(),type: PageTransitionType.fade));
                  },
                  child: const Text(
                    "Login",
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
      )),
    );
  }
}


ValueNotifier<bool> pass1Hide = ValueNotifier<bool>(true);
ValueNotifier<bool> pass2Hide = ValueNotifier<bool>(true);
