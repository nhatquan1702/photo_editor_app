import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/theme/app_color.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle displayLarge = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 57,
    fontWeight: FontWeight.bold,
  );
  TextStyle displayMedium = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );
  TextStyle displaySmall = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineLarge = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineMedium = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineSmall = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.blackGrey,
    fontSize: 22,
  );
  TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.blackGrey,
    fontSize: 18,
  );
  TextStyle titleSmall = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 14,
  );
  TextStyle labelLarge = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 14,
  );
  TextStyle labelMedium = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 12,
  );
  TextStyle labelSmall = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 11,
  );
  TextStyle bodyLarge = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 16,
  );
  TextStyle bodyMedium = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 14,
  );
  TextStyle bodySmall = TextStyle(
    color: AppColors.blackGrey,
    fontSize: 12,
  );
}