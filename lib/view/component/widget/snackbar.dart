import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String text) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: theme.backgroundColor.withOpacity(0.8),
      content: Text(
        text,
        style: TextStyle(color: theme.canvasColor.withOpacity(0.8)),
      ),
    ),
  );
}
