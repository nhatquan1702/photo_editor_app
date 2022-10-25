import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:photo_editor_app/data/model/network/client.dart';
import 'package:photo_editor_app/data/model/network/response/collection_model/collection_model.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';
import 'package:photo_editor_app/data/repository/album/album_repository.dart';

class AlbumRepositoryIml extends AlBumRepository {
  final Dio client;
  AlbumRepositoryIml({required this.client});

  @override
  Future<List<CollectionItemModel>> getCollection(int perPage) async {
    try {
      final result = await client.get(
        '/collections/featured',
        options: ClientUtils.pixelAuth,
        queryParameters: {
          'per_page': perPage,
        },
      );
      if (result.statusCode == 200) {
        final resultFromJSon = CollectionModel.fromJson(result.data);
        return resultFromJSon.collections;
      }
      return [];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<PhotoItemModel>> getPhotos(int page, int perPage) async {
    try {
      final result = await client.get(
        "/curated",
        options: ClientUtils.pixelAuth,
        queryParameters: {
          "page": page,
          "per_page": perPage,
        },
      );

      if (result.statusCode == 200) {
        final resultFromJson = PhotoModel.fromJson(result.data);
        return resultFromJson.photos;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
