import 'package:flutter/material.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/view/screen/album/album_screen.dart';
import 'package:photo_editor_app/view/screen/home/home_screen.dart';
import 'package:photo_editor_app/view/screen/photo/detail/detail_photo_screen.dart';
import 'package:photo_editor_app/view/screen/photo/edit_photo_screen.dart';
import 'package:photo_editor_app/view/screen/search/search_screen.dart';
import 'package:photo_editor_app/view/screen/welcome/welcome_screen.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );

      case AppRouteName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.search:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const SearchScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.detailPhoto:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailPhotoScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.editPhoto:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const EditPhotoScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.album:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const AlbumScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }



    return null;
  }
}
