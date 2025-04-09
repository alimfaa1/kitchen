import 'package:flutter/material.dart';

class AppColors {
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF292a2d);
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextOff = Color(0xFF5F6062);
  static const Color darkFade = Color(0xFF2c2d30);
  static const Color darkButton = Color(0xFFE27D19);
  static const Color darkIcon = Color(0xFF616161);

  // Light Theme Colors (placeholder - customize as needed)
  static const Color lightBackground = Colors.white;
  static const Color lightTextPrimary = Colors.black;
  static const Color lightTextOff = Color(0xFF9E9E9E);
  static const Color lightFade = Color(0xFFF5F5F5);
  static const Color lightButton = Color(0xFFE27D19);
  static const Color lightIcon = Color(0xFF616161);
}

class AppTextStyles {
  static double _scale(double width, double base) => width * base / 375;

  // Dark TextStyles
  static TextStyle heading(double width, {bool isDark = true}) => TextStyle(
    fontSize: _scale(width, 24),
    fontWeight: FontWeight.bold,
    fontFamily: 'LibreBaskerville',
    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
  );

  static TextStyle description(double width, {bool isDark = true}) => TextStyle(
    fontSize: _scale(width, 14),
    fontFamily: 'Inter',
    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
  );

  static TextStyle cookTime(double width, {bool isDark = true}) => TextStyle(
    fontSize: _scale(width, 12),
    fontFamily: 'Inter',
    color: isDark ? AppColors.darkTextOff : AppColors.lightTextOff,
  );

  static TextStyle ingredientsTitle(double width, {bool isDark = true}) => TextStyle(
    fontSize: _scale(width, 18),
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
  );

  static TextStyle ingredientsText(double width, {bool isDark = true}) => TextStyle(
    fontSize: _scale(width, 12),
    fontFamily: 'Inter',
    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
  );
}

class AppTheme {
  static ThemeData getTheme(BuildContext context, {required bool isDarkMode}) {
    final width = MediaQuery.of(context).size.width;
    final colors = isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;

    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor:
      isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      primaryColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      cardColor: isDarkMode ? AppColors.darkFade : AppColors.lightFade,
      iconTheme: IconThemeData(
        color: isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkMode ? AppColors.darkFade : AppColors.lightFade,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
        ),
        titleTextStyle: AppTextStyles.heading(width, isDark: isDarkMode),
      ),
      textTheme: TextTheme(
        titleLarge: AppTextStyles.heading(width, isDark: isDarkMode),
        bodyLarge: AppTextStyles.description(width, isDark: isDarkMode),
        bodyMedium: AppTextStyles.cookTime(width, isDark: isDarkMode),
        headlineSmall: AppTextStyles.ingredientsTitle(width, isDark: isDarkMode),
        bodySmall: AppTextStyles.ingredientsText(width, isDark: isDarkMode),
      ),
      colorScheme: isDarkMode
          ? const ColorScheme.dark().copyWith(
        background: AppColors.darkBackground,
        surface: AppColors.darkFade,
        onSurface: AppColors.darkTextPrimary,
      )
          : const ColorScheme.light().copyWith(
        background: AppColors.lightBackground,
        surface: AppColors.lightFade,
        onSurface: AppColors.lightTextPrimary,
      ),
    );
  }
}
