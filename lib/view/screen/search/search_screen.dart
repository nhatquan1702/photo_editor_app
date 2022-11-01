import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/data/repository/search/search_repository.dart';
import 'package:photo_editor_app/view/component/widget/photo_item_gridview.dart';
import 'package:photo_editor_app/view/component/widget/photo_shimer_loading.dart';
import 'package:photo_editor_app/view/component/widget/snackbar.dart';
import 'package:photo_editor_app/view/screen/search/search_view_model/search_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(repo: GetIt.I.get<SearchRepository>()),
      child: const SearchLayout(),
    );
  }
}

class SearchLayout extends StatefulWidget {
  const SearchLayout({super.key});

  @override
  State<SearchLayout> createState() => _SearchLayoutState();
}

class _SearchLayoutState extends State<SearchLayout> {
  final refreshController = RefreshController();
  final keywordController = TextEditingController();
  String? initialKeyword;

  @override
  void didChangeDependencies() {
    initialKeyword = ModalRoute.of(context)?.settings.arguments as String?;

    if (initialKeyword == null) return;
    if (initialKeyword?.isNotEmpty ?? false) {
      keywordController.text = initialKeyword ?? "";
      context.read<SearchCubit>().onKeywordChange(keywordController.text);
      context.read<SearchCubit>().searchPhotos();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          iconSize: 20,
          icon: Icon(
            Icons.arrow_back,
            color: theme.textTheme.headlineLarge?.color,
          ),
        ),
        backgroundColor: theme.backgroundColor,
        title: TextField(
          controller: keywordController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Nhập từ khoá',
            hintStyle: theme.textTheme.bodyMedium,
          ),
          style: theme.textTheme.bodyLarge,
          autofocus: initialKeyword != null ? false : true,
          textInputAction: TextInputAction.search,
          onChanged: context.read<SearchCubit>().onKeywordChange,
          onSubmitted: (_) {
            context.read<SearchCubit>().searchPhotos();
          },
        ),
        actions: [
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (p, c) => p.keyword != c.keyword,
            builder: (context, state) {
              if (state.keyword.isEmpty) {
                return const SizedBox();
              }
              return IconButton(
                onPressed: () {
                  keywordController.clear();
                  context.read<SearchCubit>().clearKeyword();
                },
                icon: Icon(
                  Icons.close,
                  color: theme.textTheme.headlineLarge?.color,
                ),
              );
            },
          ),
        ],
        elevation: 1,
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          /// listen when pull to request success
          if (state.photosStatus == Status.success) {
            if (refreshController.isRefresh) {
              refreshController.refreshCompleted();
            }
            if (refreshController.isLoading) {
              refreshController.loadComplete();
            }
          }

          /// listen when pull to request error
          if (state.photosStatus == Status.error) {
            if (refreshController.isRefresh) {
              refreshController.refreshCompleted();
            }
            if (refreshController.isLoading) {
              refreshController.loadComplete();
            }

            showAppSnackBar(
              context,
              "Something went wrong, please try again!",
            );
          }
        },
        builder: (context, state) {
          if (state.photosStatus == Status.initial) {
            return const SizedBox();
          }
          if (state.photosStatus != Status.success && state.photos.isEmpty) {
            return const PhotosLoading(
              isSearch: true,
            );
          }

          return SmartRefresher(
            controller: refreshController,
            header: CustomHeader(
              builder: (context, mode) {
                if (mode == RefreshStatus.idle) {
                  return const SizedBox();
                }
                return Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
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
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
            ),
            enablePullUp: true,
            enablePullDown: true,
            onRefresh: context.read<SearchCubit>().searchPhotos,
            onLoading: context.read<SearchCubit>().getNextPhotos,
            child: GridView.custom(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PhotoItemGridview(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRouteName.detailPhoto,
                        arguments: state.photos[index],
                      );
                    },
                    photoUrl: state.photos[index].src.portrait,
                    photographer: state.photos[index].photographer,
                  );
                },
                childCount: state.photos.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
