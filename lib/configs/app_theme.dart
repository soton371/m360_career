import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../configs/configs.dart';

 ThemeData kAppTheme(context) => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    textTheme: GoogleFonts.latoTextTheme(),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.title),
        )
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(AppColors.filledButtonText),
            backgroundColor: const WidgetStatePropertyAll(AppColors.filledButton),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius)
            )),
            textStyle: const WidgetStatePropertyAll(TextStyle(fontWeight: FontWeight.w600,letterSpacing: 0.5))
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(AppColors.container),
            backgroundColor: const WidgetStatePropertyAll(AppColors.seed),
            elevation: const WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius)
            )),
            textStyle: const WidgetStatePropertyAll(TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5))
        ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
      elevation: 0,
    )
);