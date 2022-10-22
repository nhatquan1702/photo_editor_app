import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/route/route.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/constant/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Photo Editor App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRouteName.welcome,
      onGenerateRoute: AppRoute.generate,
    );
  }
}
