import 'package:flutter/material.dart';
import '../../home/data/recipe_data.dart';


class RecipeDetailScreen extends StatelessWidget {
  static const routeName = '/recipeDetail';
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(recipe.description),
      ),
    );
  }
}
