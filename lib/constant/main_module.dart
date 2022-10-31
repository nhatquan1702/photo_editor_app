import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_editor_app/data/model/network/client.dart';
import 'package:photo_editor_app/data/repository/album/album_repository.dart';
import 'package:photo_editor_app/data/repository/album/album_repository_iml.dart';
import 'package:photo_editor_app/data/repository/search/search_repository.dart';
import 'package:photo_editor_app/data/repository/search/search_repository_impl.dart';

class MainModule {
  /// Main Module for initialize GetIt (DI)
  static void init() {
    /// main client for PixelAPI
    GetIt.I.registerLazySingleton(
      () => Dio().initClient("https://api.pexels.com/v1/"),
    );

    GetIt.I.registerLazySingleton<AlBumRepository>(
      () => AlbumRepositoryIml(client: GetIt.I.get()),
    );

    GetIt.I.registerLazySingleton<SearchRepository>(
          () => SearchRepositoryImpl(client: GetIt.I.get()),
    );
  }
}
