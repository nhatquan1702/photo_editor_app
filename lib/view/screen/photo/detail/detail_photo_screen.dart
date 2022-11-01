import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:photo_editor_app/constant/extention/string_to_color.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/data/model/network/response/photo_model/photo_model.dart';
import 'package:photo_editor_app/view/component/widget/loading_dialog.dart';
import 'package:photo_editor_app/view/component/widget/snackbar.dart';
import 'package:photo_editor_app/view/component/widget/success_dialog.dart';
import 'package:photo_editor_app/view/screen/photo/detail/detail_photo_view_model/detail_photo_cubit.dart';

class DetailPhotoScreen extends StatelessWidget {
  const DetailPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailPhotoCubit(),
      child: const DetailPhotoLayout(),
    );
  }
}

class DetailPhotoLayout extends StatefulWidget {
  const DetailPhotoLayout({super.key});

  @override
  State<DetailPhotoLayout> createState() => _DetailPhotoLayoutState();
}

class _DetailPhotoLayoutState extends State<DetailPhotoLayout> {
  late PhotoItemModel photo;

  @override
  void didChangeDependencies() {
    photo = ModalRoute.of(context)?.settings.arguments as PhotoItemModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<DetailPhotoCubit, DetailPhotoState>(
      listener: (context, state) {
        if (state.shareStatus == DownloadStatus.downloading) {
          showLoadingDialog(context);
        }
        if (state.shareStatus == DownloadStatus.success) {
          Navigator.pop(context);
        }

        if (state.downloadStatus == DownloadStatus.downloading) {
          showLoadingDialog(context);
        }
        if (state.downloadStatus == DownloadStatus.success) {
          Navigator.pop(context);
          showSuccessDialog(context, "Success Download!");
        }

        if (state.shareStatus == DownloadStatus.failed ||
            state.downloadStatus == DownloadStatus.failed) {
          Navigator.pop(context);
          showAppSnackBar(
            context,
            "Something wrong when downloading photo, please try again!",
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            splashRadius: 20,
            icon: Icon(
              Icons.arrow_back,
              color: theme.textTheme.headlineLarge?.color,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Chi tiết hình ảnh',
            style: theme.textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<DetailPhotoCubit>().sharePhoto(photo.src.large);
              },
              splashRadius: 20,
              icon: Icon(
                CupertinoIcons.share,
                color: theme.textTheme.headlineLarge?.color,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.66,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(
                    photo.src.original,
                  ),
                  fit: BoxFit.cover,
                  loadingBuilder: (_, widget, progress) {
                    if (progress == null) {
                      return widget;
                    }

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(photo.src.portrait),
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (_, __, ___) {
                          return Center(
                            child: Icon(
                              Icons.broken_image_sharp,
                              color: theme.canvasColor.withOpacity(0.5),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  errorBuilder: (_, __, ___) {
                    return Center(
                      child: Icon(
                        Icons.broken_image_rounded,
                        color: theme.primaryColor,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              photo.photographer,
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 12),
                            if (photo.alt != null &&
                                photo.alt?.isNotEmpty == true) ...[
                              Text(
                                photo.alt ?? "",
                                style: theme.textTheme.bodyMedium,
                                maxLines: 2,
                              ),
                              const SizedBox(height: 12),
                            ],
                            Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                    color: stringToColor(photo.avgColor),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  photo.avgColor,
                                  style: theme.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRouteName.editPhoto,
                                arguments: photo,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              "Chỉnh sửa",
                              style: theme
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: theme.canvasColor),
                            ),
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton.icon(
                            onPressed: () {
                              context
                                  .read<DetailPhotoCubit>()
                                  .downloadPhoto(photo.src.original);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            icon: Icon(
                              CupertinoIcons.arrow_down_circle,
                              color: theme
                                  .textTheme
                                  .headlineLarge
                                  ?.color,
                            ),
                            label: Text(
                              "Tải xuống",
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
