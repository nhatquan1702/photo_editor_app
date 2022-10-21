import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_editor_app/view/screen/home/home_screen.dart';

import 'constant/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodySmall: TextStyle(color: AppColors.white)),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.primarySwatch.shade50),
        navigationBarTheme:
            NavigationBarThemeData(indicatorColor: AppColors.primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
        ),
        chipTheme: ChipThemeData(backgroundColor: AppColors.secondaryColor),
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.primarySwatch.shade50,
      ),
      home: const HomeView(),
    );
  }
}
