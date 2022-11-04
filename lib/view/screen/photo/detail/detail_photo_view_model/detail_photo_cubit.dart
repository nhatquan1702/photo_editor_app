import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:share_plus/share_plus.dart';

part 'detail_photo_state.dart';
part 'detail_photo_cubit.freezed.dart';

class DetailPhotoCubit extends Cubit<DetailPhotoState> {
  final dio = Dio();

  DetailPhotoCubit() : super(const DetailPhotoState());

  void sharePhoto(String photoUrl) async {
    if (state.shareStatus == DownloadStatus.downloading) return;

    try {
      emit(state.copyWith(shareStatus: DownloadStatus.downloading));

      final response = await http.get(Uri.parse(photoUrl));
      final bytes = response.bodyBytes;

      final temp = await getTemporaryDirectory();
      final path = "${temp.path}/shared_image.jpeg";
      File(path).writeAsBytesSync(bytes);

      if (response.statusCode == 200) {
        emit(state.copyWith(shareStatus: DownloadStatus.success));
        await Share.shareFiles([path]);
      }
    } catch (e) {
      emit(state.copyWith(shareStatus: DownloadStatus.failed));
    } finally {
      emit(state.copyWith(shareStatus: DownloadStatus.initial));
    }
  }

  void downloadPhoto(String photoUrl) async {
    if (Platform.isAndroid) {
      var storage = await Permission.storage.isGranted;
      if (!storage) {
        var status = await Permission.storage.request();
        if (!status.isGranted) return null;
      }

      var externalStorage = await Permission.manageExternalStorage.isGranted;
      if (!externalStorage) {
        var status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) return null;
      }
    }

    if (state.downloadStatus == DownloadStatus.downloading) return;
    try {
      emit(state.copyWith(downloadStatus: DownloadStatus.downloading));
      var response = await Dio().get(
        photoUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 100,
        );
        emit(state.copyWith(downloadStatus: DownloadStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(downloadStatus: DownloadStatus.failed));
    } finally {
      emit(state.copyWith(downloadStatus: DownloadStatus.initial));
    }
  }
}
