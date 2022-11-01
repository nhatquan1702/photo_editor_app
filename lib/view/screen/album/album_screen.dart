import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/constant/theme/app_color.dart';
import 'package:photo_editor_app/view/component/widget/snackbar.dart';
import 'package:photo_editor_app/view/screen/album/album_view_model/album_cubit.dart';
import 'package:photo_editor_app/view/screen/album/widget/collection_widget.dart';
import 'package:photo_editor_app/view/screen/album/widget/photo_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumCubit(
        repo: GetIt.I.get(),
      )
        ..getCollection()
        ..getPhotos(),
      child: const AlbumLayout(),
    );
  }
}

class AlbumLayout extends StatefulWidget {
  const AlbumLayout({Key? key}) : super(key: key);

  @override
  State<AlbumLayout> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumLayout> {
  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController();
    final theme = Theme.of(context);

    return BlocListener<AlbumCubit, AlbumState>(
      listener: (context, state) {
        if (state.collectionStatus == Status.success &&
            state.photosStatus == Status.success) {
          if (refreshController.isRefresh) {
            refreshController.refreshCompleted();
          }
          if (refreshController.isLoading) {
            refreshController.loadComplete();
          }
        }
        if (state.collectionStatus == Status.error &&
            state.photosStatus == Status.error) {
          if (refreshController.isRefresh) {
            refreshController.refreshCompleted();
          }
          if (refreshController.isLoading) {
            refreshController.loadComplete();
          }
          showAppSnackBar(context, "Something went wrong, please try again!");
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SmartRefresher(
            controller: refreshController,
            header: CustomHeader(
              builder: (context, mode) {
                if (mode == RefreshStatus.idle) {
                  return const SizedBox();
                }
                return Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
            ),
            footer: CustomFooter(
              builder: (context, mode) {
                if (mode == LoadStatus.idle) {
                  return const SizedBox();
                }
                return Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
            ),
            enablePullUp: true,
            onRefresh: () {
              context.read<AlbumCubit>().getCollection(showLoading: false);
              context.read<AlbumCubit>().getPhotos(showLoading: false);
            },
            enablePullDown: true,
            onLoading: () {
              context.read<AlbumCubit>().getNextPhotos();
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  centerTitle: true,
                  title: Text(
                    "Khám phá",
                    style: theme.textTheme.headlineSmall,
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  backgroundColor: theme.scaffoldBackgroundColor,
                  elevation: 0,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(76),
                    child: Container(
                      height: 76,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouteName.search);
                        },
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: theme.backgroundColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.search,
                                color: theme.canvasColor.withOpacity(0.6),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Nhập từ khóa tìm kiếm",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.canvasColor.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CollectionWidget(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Phổ biến dành cho bạn",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.all(16),
                  sliver: PhotoWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
