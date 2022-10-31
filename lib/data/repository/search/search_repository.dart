import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';

abstract class SearchRepository {
  Future<List<PhotoItemModel>> searchPhotoByKeyword(
    int page,
    int perPage,
    String keyword,
  );
}
