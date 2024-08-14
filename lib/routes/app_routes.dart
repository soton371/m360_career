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
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginScreen())),
    GoRoute(
        path: RouteNames.forgotPassword,
        name: RouteNames.forgotPassword,
        pageBuilder: (context, state) =>
        const MaterialPage(child: ForgotPasswordScreen())),
    GoRoute(
        path: RouteNames.otp,
        name: RouteNames.otp,
        pageBuilder: (context, state) =>
        const MaterialPage(child: OtpScreen())),
    GoRoute(
        path: RouteNames.resetPassword,
        name: RouteNames.resetPassword,
        pageBuilder: (context, state) =>
        const MaterialPage(child: ResetPasswordScreen())),
    GoRoute(
        path: RouteNames.register,
        name: RouteNames.register,
        pageBuilder: (context, state) =>
        const MaterialPage(child: SignUpScreen())),
  ]);
}
