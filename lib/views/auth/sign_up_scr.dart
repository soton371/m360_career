import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../blocs/blocs.dart';
import '../../configs/configs.dart';
import '../../utilities/utilities.dart';
import '../../views/views.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController fNameCon = TextEditingController(),
        emailCon = TextEditingController(),
        passwordCon1 = TextEditingController(),
        passwordCon2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SendOtpLoading) {
            appLoader(context);
          } else if (state is SendOtpSuccess) {
            Navigator.pop(context);
            Navigator.push(
                context,
                PageTransition(
                    child: const OtpScreen(
                      type: 0,
                    ),
                    type: PageTransitionType.fade));
          } else if (state is SendOtpFailed) {
            Navigator.pop(context);
            appDialog(context,
                msg: state.message ?? 'Failed to send OTP code.',
                title: state.title);
          }
        },
        child: Form(
          key: formKey,
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
                height: AppSizes.bodyPadding.h * 2,
              ),
              //for name
              FadeInUp(
                child: AppTextField(
                  label: 'Full Name',
                  hintText: 'Soton Ahmed',
                  textEditingController: fNameCon,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Enter your full name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              //end for name

              //for email
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
                        textInputAction: TextInputAction.next,
                        suffixIcon: InkWell(
                          onTap: () {
                            pass1Hide.value = !value;
                          },
                          child: HugeIcon(
                            icon: value
                                ? HugeIcons.strokeRoundedViewOff
                                : HugeIcons.strokeRoundedView,
                            color: AppColors.hint,
                          ),
                        ),
                        textEditingController: passwordCon1,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Enter your password';
                          } else if (v.trim().length < 6) {
                            return 'Password length must be more than 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
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
                        textInputAction: TextInputAction.done,
                        suffixIcon: InkWell(
                          onTap: () {
                            pass2Hide.value = !value;
                          },
                          child: HugeIcon(
                            icon: value
                                ? HugeIcons.strokeRoundedViewOff
                                : HugeIcons.strokeRoundedView,
                            color: AppColors.hint,
                          ),
                        ),
                        textEditingController: passwordCon2,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Enter your re-password';
                          } else if (v.toString().trim() !=
                              passwordCon1.text.trim()) {
                            return 'Password and re-password do not match';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
              ),
              //end for password

              SizedBox(
                height: 80.h,
              ),

              FadeInUp(
                  child: ElevatedButton(
                      onPressed: () async {
                        final currentState = formKey.currentState;
                        if (currentState != null && currentState.validate()) {
                          final Map<String, String> payload = {
                            "full_name": fNameCon.text.trim(),
                            "email": emailCon.text.trim(),
                            "password": passwordCon2.text.trim()
                          };
                          context
                              .read<AuthBloc>()
                              .add(SendOtpForRegistration(payload));
                        }
                      },
                      child: const Text("SIGN UP"))),

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
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const LoginScreen(),
                                type: PageTransitionType.fade));
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
          ),
        ),
      ),
    );
  }
}

ValueNotifier<bool> pass1Hide = ValueNotifier<bool>(true);
ValueNotifier<bool> pass2Hide = ValueNotifier<bool>(true);
