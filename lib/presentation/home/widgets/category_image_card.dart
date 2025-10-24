import 'package:flutter/material.dart';

class CategoryImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CategoryImageCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive width: 24% of screen on large screens, 30% on medium, 35% on small
    final cardWidth = screenWidth > 800
        ? screenWidth * 0.24
        : screenWidth > 480
            ? screenWidth * 0.40
            : screenWidth * 0.25;

    // Responsive image height: 1:1 aspect ratio
    final imageHeight = cardWidth;

    return SizedBox(
      width: cardWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: theme.textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}