import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_career/views/auth/forgot_password_scr.dart';
import 'package:m360_career/views/auth/reset_password_scr.dart';
import '../views/views.dart';

part 'route_name.dart';

class AppRoutes {
  static final router = GoRouter(routes: [
    GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: RouteNames.forgotPassword,
        name: RouteNames.forgotPassword,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: const ForgotPasswordScreen())),
    GoRoute(
        path: RouteNames.otp,
        name: RouteNames.otp,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: const OtpScreen())),
    GoRoute(
        path: RouteNames.resetPassword,
        name: RouteNames.resetPassword,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: const ResetPasswordScreen())),
    GoRoute(
        path: RouteNames.register,
        name: RouteNames.register,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: const SignUpScreen())),
  ]);
}

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required super.child,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
