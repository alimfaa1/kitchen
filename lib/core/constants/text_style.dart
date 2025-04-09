import 'dart:ui';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const cardTitle = TextStyle(
    fontFamily: 'LibreBaskerville',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const description = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.textPrimary,
  );

  static const cookTime = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: AppColors.textPrimary,
  );

  static const ingredientsTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const ingredientsText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: AppColors.textPrimary,
  );
}