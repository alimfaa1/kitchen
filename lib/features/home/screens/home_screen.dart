import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['كيك', 'عيش', 'حلو', 'حادق'];
  String selectedCategory = 'حادق';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان وأيقونة الشبكة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_view_rounded),
                    color: AppColors.iconColor,
                    iconSize: 26,
                  ),
                  Text(
                    "وصفات",
                    style: AppTextStyles.cardTitle,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // قائمة التصنيفات الرأسية المدورة
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: categories.reversed.map((category) {
                      final isSelected = category == selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            child: Text(
                              category,
                              style: AppTextStyles.cardTitle.copyWith(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.textPrimary
                                    : AppColors.textOff,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [

                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
