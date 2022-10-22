import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/theme/app_color.dart';

void showAppSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.black.withOpacity(0.8),
      content: Text(text),
    ),
  );
}
