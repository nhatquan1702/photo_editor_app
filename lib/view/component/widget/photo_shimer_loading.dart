import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class PhotosLoading extends StatelessWidget {
  final bool isSearch;
  const PhotosLoading({super.key, required this.isSearch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return isSearch ? GridView.custom(
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
          return Shimmer.fromColors(
            baseColor: theme.backgroundColor.withOpacity(0.5),
            highlightColor: theme.canvasColor.withOpacity(0.5),
            child: Container(
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        childCount: 8,
      ),
    ): SliverGrid(
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
          return Shimmer.fromColors(
            baseColor: theme.backgroundColor.withOpacity(0.5),
            highlightColor: theme.canvasColor.withOpacity(0.5),
            child: Container(
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        childCount: 4,
      ),
    );
  }
}