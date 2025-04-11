import 'package:flutter/material.dart';
import 'package:kitchen/data/models/recipe_data.dart';
import '../../features/details/screens/details_screen.dart';
import '../../features/home/screens/home_screen.dart';


class AppRouter {
  static const String homeRoute = '/';
  static const String detailRoute = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case detailRoute:
        final recipe = settings.arguments as Recipe;
        return MaterialPageRoute(
          builder: (_) => RecipeDetailsScreen(recipe: recipe),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
