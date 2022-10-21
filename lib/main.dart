import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_editor_app/view/home/home_screen.dart';

import 'constant/app_color.dart';

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
        appBarTheme: AppBarTheme(backgroundColor: AppColors.lightBlue),
        navigationBarTheme:
            NavigationBarThemeData(indicatorColor: AppColors.darkBlue),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.darkBlue,
        ),
        chipTheme: ChipThemeData(backgroundColor: AppColors.cyan),
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.lightBlue,
      ),
      home: const HomeView(),
    );
  }
}
