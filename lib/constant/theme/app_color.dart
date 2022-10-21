import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF489E83);
  static Color primaryLight = const Color.fromARGB(255, 225, 241, 255);
  static Color secondaryColor = const Color.fromARGB(255, 189, 250, 236);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color blackGrey = const Color.fromARGB(255, 39, 39, 39);
  static Color backgroundBlack = const Color.fromARGB(255, 37, 37, 37);
  static Color backgroundWhite = const Color.fromARGB(255, 255, 255, 255);
  static Color backgroundGray = const Color.fromARGB(255, 240, 240, 240);
  static Color transparent = Colors.transparent;

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF489E83,
    {
      50: Color(0xffb3e3d4),
      100: Color(0xFF91c5b5),
      200: Color(0xFF7fbba8),
      300: Color(0xFF6db19c),
      400: Color(0xFF5aa88f),
      500: Color(0xFF489E83),
      600: Color(0xFF418e76),
      700: Color(0xFF3a7e69),
      800: Color(0xFF326f5c),
      900: Color(0xFF2b5f4f),
    },
  );
}