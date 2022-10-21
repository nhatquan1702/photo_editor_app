import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/app_style.dart';
import 'package:photo_editor_app/constant/theme/app_color.dart';

class AppTheme {
  static final AppTextStyle _textStyle = AppTextStyle.instance;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundWhite,
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    primarySwatch: AppColors.primarySwatch,
    textTheme: TextTheme(
      displayLarge: _textStyle.displayLarge,
      displayMedium: _textStyle.displayMedium,
      displaySmall: _textStyle.displaySmall,
      headlineLarge: _textStyle.headlineLarge,
      headlineMedium: _textStyle.headlineMedium,
      headlineSmall: _textStyle.headlineSmall,
      titleLarge: _textStyle.titleLarge,
      titleSmall: _textStyle.titleSmall,
      titleMedium: _textStyle.titleMedium,
      labelLarge: _textStyle.labelLarge,
      labelMedium: _textStyle.labelMedium,
      labelSmall: _textStyle.labelSmall,
      bodyLarge: _textStyle.bodyLarge,
      bodyMedium: _textStyle.bodyMedium,
      bodySmall: _textStyle.bodySmall,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColors.backgroundBlack,
    scaffoldBackgroundColor: AppColors.backgroundBlack,
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.primarySwatch,
    textTheme: TextTheme(
      displayLarge: _textStyle.displayLarge.copyWith(color: AppColors.white),
      displayMedium: _textStyle.displayMedium.copyWith(color: AppColors.white),
      displaySmall: _textStyle.displaySmall.copyWith(color: AppColors.white),
      headlineLarge: _textStyle.headlineLarge.copyWith(color: AppColors.white),
      headlineMedium: _textStyle.headlineMedium.copyWith(color: AppColors.white),
      headlineSmall: _textStyle.headlineSmall.copyWith(color: AppColors.white),
      titleLarge: _textStyle.titleLarge.copyWith(color: AppColors.white),
      titleSmall: _textStyle.titleSmall.copyWith(color: AppColors.white),
      titleMedium: _textStyle.titleMedium.copyWith(color: AppColors.white),
      labelLarge: _textStyle.labelLarge.copyWith(color: AppColors.white),
      labelMedium: _textStyle.labelMedium.copyWith(color: AppColors.white),
      labelSmall: _textStyle.labelSmall.copyWith(color: AppColors.white),
      bodyLarge: _textStyle.bodyLarge.copyWith(color: AppColors.white),
      bodyMedium: _textStyle.bodyMedium.copyWith(color: AppColors.white),
      bodySmall: _textStyle.bodySmall.copyWith(color: AppColors.white),
    ),
  );
}