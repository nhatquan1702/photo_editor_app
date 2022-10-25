import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:photo_editor_app/data/model/network/response/collection_model/collection_model.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';
import 'package:photo_editor_app/data/repository/album/album_repository.dart';

part 'album_state.dart';
part 'album_cubit.freezed.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final AlBumRepository repo;
  AlbumCubit({
    required this.repo,
  }) : super(const AlbumState());

  void getCollection({
    bool showLoading = true,
  }) async {
    if (showLoading) emit(state.copyWith(collectionStatus: Status.loading));

    try {
      final result = await repo.getCollection(20);
      if (!showLoading) {
        emit(state.copyWith(collectionStatus: Status.loading));
      }
      emit(state.copyWith(
        collectionStatus: Status.success,
        collections: result,
      ));
    } catch (e) {
      if (!showLoading) {
        emit(state.copyWith(collectionStatus: Status.loading));
      }
      emit(state.copyWith(collectionStatus: Status.error));
    }
  }

  void getPhotos({
    bool showLoading = true,
    int page = 1,
  }) async {
    if (showLoading) emit(state.copyWith(photosStatus: Status.loading));
    try {
      final result = await repo.getPhotos(page, 24);

      if (page == 1) {
        emit(state.copyWith(
          photosPage: page,
          hasReachMax: result.isEmpty,
          photosStatus: Status.success,
          photos: result,
        ));

        return;
      }

      emit(state.copyWith(
        photosPage: page,
        hasReachMax: result.isEmpty,
        photosStatus: Status.success,
        photos: List.from(state.photos)..addAll(result),
      ));
    } catch (e) {
      if (!showLoading) {
        emit(state.copyWith(photosStatus: Status.loading));
      }
      emit(state.copyWith(photosStatus: Status.error));
    }
  }

  void getNextPhotos() {
    final nextPage = state.photosPage + 1;
    getPhotos(showLoading: false, page: nextPage);
  }
}
