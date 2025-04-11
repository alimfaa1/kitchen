// 📦 Recipe Card using Recipe model
import 'package:flutter/material.dart';
import 'package:kitchen/core/theme/theme.dart';


import 'package:kitchen/data/local/recipe_data.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isDark;
  final double width;
  final double height;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.isDark,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 227 / 375,
      height: height * 277 / 812,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.imagePath,
                width: width * 227 / 375,
                height: height * 182 / 812,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            recipe.title,
            style: AppTextStyles.cardText(width, isDark: isDark),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            'إجمالي الوقت ${recipe.totalTime}',
            style: AppTextStyles.cookTime(width, isDark: isDark),
          ),
        ],
      ),
    );
  }
}