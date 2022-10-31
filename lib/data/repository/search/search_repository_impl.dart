import 'package:dio/dio.dart';
import 'package:photo_editor_app/data/model/network/client.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';
import 'package:photo_editor_app/data/repository/search/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final Dio client;

  SearchRepositoryImpl({
    required this.client,
  });

  @override
  Future<List<PhotoItemModel>> searchPhotoByKeyword(
    int page,
    int perPage,
    String keyword,
  ) async {
    try {
      final result = await client.get(
        "/search",
        options: ClientUtils.pixelAuth,
        queryParameters: {
          "page": page,
          "per_page": perPage,
          "query": keyword,
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
