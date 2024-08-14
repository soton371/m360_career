import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/routes/app_routes.dart';
import '../../configs/configs.dart';
import 'blocs/blocs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) {
          return MaterialApp.router(
            title: 'M360 Career',
            theme: kAppTheme(context),
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}

