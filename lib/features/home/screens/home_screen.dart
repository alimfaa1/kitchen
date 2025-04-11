// 🏠 Home Screen with unified data usage
import 'package:flutter/material.dart';
import 'package:kitchen/data/models/recipe_data.dart';
import 'package:kitchen/core/theme/theme.dart';
import '../../../data/models/recipe_data.dart';
import '../widgets/recipe_card.dart';
import '../widgets/favorite_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = true;
  int selectedIndex = 0;
  final List<String> categories = ['الكل', 'الفطار', 'الغداء', 'العشاء', 'سناكس'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Theme(
          data: AppTheme.getTheme(context, isDarkMode: isDarkMode),
          child: Scaffold(
            backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: ListView(
                children: [
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.grid_view)),
                      IconButton(
                        icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                        color: isDarkMode ? Colors.white : Colors.black,
                        onPressed: () => setState(() => isDarkMode = !isDarkMode),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Text('الوصفات', style: AppTextStyles.heading(width, isDark: isDarkMode)),
                  SizedBox(height: height * 0.015),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(categories.length, (index) {
                        final selected = index == selectedIndex;
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => selectedIndex = index),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: height * 0.005),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      categories[index],
                                      style: AppTextStyles.selec(width, isDark: isDarkMode, selected: selected),
                                    ),
                                    if (selected)
                                      Container(
                                        margin: EdgeInsets.only(top: height * 0.007),
                                        height: 2,
                                        width: width * 0.06,
                                        color: AppColors.darkButton,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.08),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    height: height * 277 / 812,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      separatorBuilder: (_, __) => SizedBox(width: width * 0.04),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: recipes[index],
                        ),
                        child: RecipeCard(
                          recipe: recipes[index],
                          isDark: isDarkMode,
                          width: width,
                          height: height,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text('التفضيلات', style: AppTextStyles.reco(width, isDark: isDarkMode)),
                  SizedBox(height: height * 0.015),
                  SizedBox(
                    height: height * 187 / 812,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      itemCount: recipes.length,
                      separatorBuilder: (_, __) => SizedBox(width: width * 0.04),
                      itemBuilder: (context, index) => FavoriteCard(
                        recipe: recipes[index],
                        width: width,
                        isDark: isDarkMode,
                        onTap: () => Navigator.pushNamed(context, '/detail', arguments: recipes[index]), height: height,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}