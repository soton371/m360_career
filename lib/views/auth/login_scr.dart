import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:m360_career/blocs/blocs.dart';
import 'package:m360_career/routes/app_routes.dart';
import '../../configs/configs.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../views.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailCon = TextEditingController(),
        passwordCon = TextEditingController();
    final passwordHide = ValueNotifier<bool>(true);
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            appLoader(context);
          } else if (state is LoginSuccess) {
            context.goNamed(RouteNames.home, extra: state.token);
          } else if (state is LoginFailed) {
            context.pop();
            appDialog(context,
                msg: state.message ?? 'Failed to login!', title: state.title);
          }
        },
        child: ListView(
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

            const SizedBox(
              height: 15,
            ),
            //for password
            FadeInUp(
              child: ValueListenableBuilder(
                  valueListenable: passwordHide,
                  builder: (context, value, _) {
                    return AppTextField(
                      label: 'Password',
                      hintText: '•••••••••••',
                      obscureText: value,
                      textInputAction: TextInputAction.done,
                      suffixIcon: InkWell(
                        onTap: () {
                          passwordHide.value = !value;
                        },
                        child: HugeIcon(
                          icon: value
                              ? HugeIcons.strokeRoundedViewOff
                              : HugeIcons.strokeRoundedView,
                          color: AppColors.hint,
                        ),
                      ),
                      textEditingController: passwordCon,
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

            FadeInUp(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        context.pushNamed(RouteNames.forgotPassword);
                      },
                      child: const Text("Forgot Password?"))),
            ),

            SizedBox(height: AppSizes.bodyPadding.h * 2),

            FadeInUp(
                child: ElevatedButton(
                    onPressed: () {
                      final currentState = formKey.currentState;
                      if (currentState != null && currentState.validate()) {
                        context.read<AuthBloc>().add(DoLogin(
                            emailCon.text.trim(), passwordCon.text.trim()));
                      }
                    },
                    child: const Text("LOGIN"))),

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
                      context.goNamed(RouteNames.register);
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
      ),
    );
  }
}
