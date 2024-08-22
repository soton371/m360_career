import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_career/blocs/blocs.dart';
import 'package:m360_career/configs/app_urls.dart';
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is SendOtpLoading){
            appLoader(context);
          }else if(state is SendOtpSuccess){
            context.pop();
            context.pushNamed(RouteNames.otp, extra: true);
          }else if(state is SendOtpFailed){
            context.pop();
            appDialog(context, msg: state.message??'Failed to send otp.', title: state.title);
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.bodyPadding),
          children: [
            FadeInUp(
                child: const AuthHeader(
                    title: "Forgot Password🔑",
                    subtitle:
                    "Enter your email address to get an OTP code to reset your password.")),
            const SizedBox(
              height: 80,
            ),
            FadeInUp(
              child: Form(
                key: formKey,
                child: AppTextField(
                  label: 'Email',
                  hintText: 'Soton.m360ict@gmail.com',
                  textEditingController: emailCon,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: (v) {
                    if (v == null || v
                        .trim()
                        .isEmpty) {
                      return 'Enter your email';
                    } else if (!isValidEmail(v.trim())) {
                      return 'Enter valid email';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.bodyPadding),
        child: ElevatedButton(
            onPressed: () {
              logger.d('message');
              final currentState = formKey.currentState;
              if (currentState != null && currentState.validate()) {
                logger.d('message2');
                context.read<AuthBloc>().add(DoSendOtp({
                  "email": emailCon.text.trim(),
                },1));
              }
            },
            child: const Text("CONTINUE")),
      ),
    );
  }
}
