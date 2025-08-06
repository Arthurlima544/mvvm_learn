import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
    labelSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
  );
  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.grey3,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  );
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.ligthColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [],
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [],
  );
}
