import 'package:flutter/material.dart';

class PhotoItemGridview extends StatelessWidget {
  final VoidCallback onTap;
  final String photoUrl;
  final String photographer;

  const PhotoItemGridview({
    super.key,
    required this.onTap,
    required this.photoUrl,
    required this.photographer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                photoUrl,
              ),
              fit: BoxFit.cover,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [theme.backgroundColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              photographer,
              style:
                  theme.textTheme.bodySmall?.copyWith(color: theme.canvasColor),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
