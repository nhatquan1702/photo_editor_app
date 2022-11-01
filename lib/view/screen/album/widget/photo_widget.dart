import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_editor_app/constant/enum/status.dart';
import 'package:photo_editor_app/constant/strings.dart';
import 'package:photo_editor_app/view/component/widget/photo_item_gridview.dart';
import 'package:photo_editor_app/view/component/widget/photo_shimer_loading.dart';
import 'package:photo_editor_app/view/screen/album/album_view_model/album_cubit.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, state) {
        if (state.photosStatus != Status.success && state.photos.isEmpty) {
          return const PhotosLoading(
            isSearch: false,
          );
        }

        return SliverGrid(
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
          delegate: SliverChildBuilderDelegate(
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
        );
      },
    );
  }
}
