import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_editor_app/data/model/network/client.dart';

class MainModule {
  /// Main Module for initialize GetIt (DI)
  static void init() {
    /// main client for PixelAPI
    GetIt.I.registerLazySingleton(
      () => Dio().initClient("https://api.pexels.com/v1/"),
    );
  }
}
