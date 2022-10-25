import 'package:photo_editor_app/data/model/network/response/collection_model/collection_model.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';

abstract class AlBumRepository{
  Future<List<CollectionItemModel>> getCollection (int perPage);

  Future<List<PhotoItemModel>> getPhotos(int page, int perPage);
}