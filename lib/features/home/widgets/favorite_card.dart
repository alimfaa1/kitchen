// ✅ Favorite Card using Recipe model from correct path
import 'package:flutter/material.dart';
import 'package:kitchen/core/theme/theme.dart';
import 'package:kitchen/data/models/recipe_data.dart';

class FavoriteCard extends StatelessWidget {
  final Recipe recipe;
  final double width;
  final double height;
  final bool isDark;
  final VoidCallback? onTap;

  const FavoriteCard({
    super.key,
    required this.recipe,
    required this.width,
    required this.height,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: width * 335 / 375, // Make width responsive instead of full
        height: height *188 / 812, // Increase height for better visibility
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(recipe.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Overlay fade
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'بواسطة ${recipe.author}',
                    style: AppTextStyles.cardBy(width, isDark: isDark),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.title,
                    style: AppTextStyles.cardDes(width, isDark: isDark),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}