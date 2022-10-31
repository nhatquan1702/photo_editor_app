import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';
import 'package:photo_editor_app/data/repository/search/search_repository.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repo;
  SearchCubit({
    required this.repo,
  }) : super(const SearchState());

  void onKeywordChange(String value) {
    emit(state.copyWith(keyword: value));
  }

  void clearKeyword() {
    emit(state.copyWith(keyword: ""));
  }

  void searchPhotos({
    bool showLoading = true,
    int page = 1,
  }) async {
    if (showLoading) emit(state.copyWith(photosStatus: Status.loading));
    try {
      final result = await repo.searchPhotoByKeyword(page, 24, state.keyword);

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
      emit(state.copyWith(photosStatus: Status.error));
    }
  }

  void getNextPhotos() {
    final nextPage = state.photosPage + 1;
    searchPhotos(showLoading: false, page: nextPage);
  }
}