import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:m360_career/blocs/blocs.dart';

import '../../configs/configs.dart';
import '../../routes/app_routes.dart';
import '../../widgets/widgets.dart';
import '../views.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final passwordCon1 = TextEditingController(),
        passwordCon2 = TextEditingController();

    final pass1Hide = ValueNotifier<bool>(true);
    final pass2Hide = ValueNotifier<bool>(true);
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is ResetPasswordLoading){
            appLoader(context);
          }else if(state is ResetPasswordSuccess){
            context.pop();
            context.goNamed(RouteNames.login);
            appToast(context, "You have successfully reset and created a new password.", 'Welcome Back!');
          }else if(state is ResetPasswordFailed){
            context.pop();
            appDialog(context, msg: state.message??'', title: state.title);
          }
        },
        child: Form(
          key: formKey,
          child: ListView(
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
                child: ValueListenableBuilder(
                    valueListenable: pass1Hide,
                    builder: (context, value, _) {
                      return AppTextField(
                        label: 'Create a new password',
                        hintText: '••••••••••',
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
                          } else if (v
                              .trim()
                              .length < 6) {
                            return 'Password length must be more than 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
              ),
              FadeInUp(
                child: ValueListenableBuilder(
                  valueListenable: pass2Hide,
                  builder: (context, value, _) {
                    return AppTextField(
                      label: 'Confirm a new password',
                      hintText: '••••••••••',
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
                          return 'Enter your confirm password';
                        } else if (v.toString().trim() !=
                            passwordCon1.text.trim()) {
                          return 'Password and confirm password do not match';
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.bodyPadding.r),
        child: ElevatedButton(
            onPressed: () {
              final currentState = formKey.currentState;
              if (currentState != null && currentState.validate()) {
                context.read<AuthBloc>().add(DoResetPassword({
                  "password": passwordCon2.text.trim()
                }));
              }
              // appDialog(context,
              //     title: "Welcome Back!",
              //     msg:
              //     "You have successfully reset and created a new password.",
              //     isSuccess: true,
              //     actions: [
              //       SizedBox(
              //         width: double.maxFinite,
              //         child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(100))),
              //             onPressed: () {
              //               context.goNamed(RouteNames.home);
              //             },
              //             child: const Text("Go to Home")),
              //       )
              //     ]);
            },
            child: const Text("CONTINUE")),
      ),
    );
  }
}
