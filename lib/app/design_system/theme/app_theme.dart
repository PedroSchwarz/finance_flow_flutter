import 'package:finance_flow/app/design_system/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF6750A4);
  static const Color primaryPurpleLight = Color(0xFFCCBDF4);

  static const Color lightBackgroundColor = Color(0xFFFDFDFD);
  static const Color lightInputBackgroundColor = Color.fromARGB(255, 225, 225, 225);
  static const Color darkBackgroundColor = Color.fromARGB(255, 46, 46, 46);
  static const Color darkInputBackgroundColor = Color.fromARGB(255, 62, 62, 62);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple, brightness: Brightness.light),
    scaffoldBackgroundColor: lightBackgroundColor,
    textTheme: AppTypography.defaultTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackgroundColor,
      foregroundColor: darkBackgroundColor,
      titleTextStyle: AppTypography.defaultTextTheme.displaySmall?.copyWith(color: primaryPurple),
      centerTitle: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightInputBackgroundColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: primaryPurple, width: 2)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(textStyle: AppTypography.defaultTextTheme.titleMedium)),
    progressIndicatorTheme: ProgressIndicatorThemeData(trackGap: 3, strokeCap: StrokeCap.round, circularTrackColor: Colors.grey.shade300),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryPurpleLight, brightness: Brightness.dark),
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
      foregroundColor: lightBackgroundColor,
      titleTextStyle: AppTypography.defaultTextTheme.displaySmall?.copyWith(color: primaryPurpleLight),
      centerTitle: false,
    ),
    textTheme: AppTypography.defaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      // fillColor: darkInputBackgroundColor,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: primaryPurpleLight, width: 2)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(textStyle: AppTypography.defaultTextTheme.titleMedium)),
    progressIndicatorTheme: ProgressIndicatorThemeData(trackGap: 3, strokeCap: StrokeCap.round, circularTrackColor: Colors.grey.shade300),
  );
}
