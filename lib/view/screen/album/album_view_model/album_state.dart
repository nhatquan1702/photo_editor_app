part of 'album_cubit.dart';

@freezed
class AlbumState with _$AlbumState {
  const factory AlbumState({
    @Default(Status.initial) Status collectionStatus,
    @Default([]) List<CollectionItemModel> collections,

    //photo state
    @Default(1) int photosPage,
    @Default(false) bool hasReachMax,
    @Default(Status.initial) Status photosStatus,
    @Default([]) List<PhotoItemModel> photos,
  }) = _AlbumState;
}
