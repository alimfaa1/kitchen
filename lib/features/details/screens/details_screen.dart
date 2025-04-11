import 'package:flutter/material.dart';
import 'package:kitchen/data/local/recipe_data.dart';
import 'package:kitchen/features/details/screens/video_webview_screen.dart';
import 'package:kitchen/core/theme/theme.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  bool showDetails = false;
  bool allowScroll = false;
  double currentSheetSize = 0.45;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final recipe = widget.recipe;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: height * 0.55,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      recipe.imagePath,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.25),
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (_) => true,
              child: DraggableScrollableActuator(
                child: DraggableScrollableSheet(
                  initialChildSize: currentSheetSize,
                  minChildSize: currentSheetSize,
                  maxChildSize: allowScroll ? 0.75 : currentSheetSize,
                  builder: (context, scrollController) => Container(
                    padding: EdgeInsets.fromLTRB(width * 0.04, width * 0.04, width * 0.04, 100),
                    decoration: BoxDecoration(
                      color: isDarkMode ? AppColors.darkFade.withOpacity(0.6) : AppColors.lightFade,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: allowScroll ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showDetails)
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          if (!showDetails) ...[
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    recipe.imagePath,
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'بواسطة ${recipe.author}',
                                  style: AppTextStyles.cardBy(width, isDark: isDarkMode),
                                ),
                              ],
                            ),
                          ],
                          SizedBox(height: height * 0.015),
                          Text(
                            recipe.title,
                            style: AppTextStyles.cardDes(width, isDark: isDarkMode),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            recipe.description,
                            style: AppTextStyles.description(width, isDark: isDarkMode),
                          ),
                          SizedBox(height: height * 0.01),

                          if (showDetails) ...[
                            Divider(
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                            SizedBox(height: height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildTimeInfo('🕒 التحضير', recipe.prepTime, width, isDarkMode),
                                _buildTimeInfo('🔥 الطهي', recipe.cookTime, width, isDarkMode),
                                _buildTimeInfo('⏱ الكلي', recipe.totalTime, width, isDarkMode),
                              ],
                            ),
                            SizedBox(height: height * 0.03),
                            Divider(
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                            SizedBox(height: height * 0.03),
                            Text(
                              'المكونات',
                              style: AppTextStyles.ingredientsTitle(width, isDark: isDarkMode),
                            ),
                            SizedBox(height: height * 0.015),
                            ...recipe.ingredients.map((ingredient) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                '• $ingredient',
                                style: AppTextStyles.ingredientsText(width, isDark: isDarkMode),
                              ),
                            )),

                            SizedBox(height: height * 0.03),

                            Text(
                              'الخطوات',
                              style: AppTextStyles.ingredientsTitle(width, isDark: isDarkMode),
                            ),
                            SizedBox(height: height * 0.015),
                            ...?recipe.steps?.asMap().entries.map((entry) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                '${entry.key + 1}. ${entry.value}',
                                style: AppTextStyles.ingredientsText(width, isDark: isDarkMode),
                              ),
                            )),
                          ],
                          SizedBox(height: height * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: FloatingActionButton.extended(
                onPressed: () {
                  if (!showDetails) {
                    setState(() {
                      showDetails = true;
                      allowScroll = true;
                      currentSheetSize = 0.55;
                    });
                    Future.delayed(const Duration(milliseconds: 100), () {
                      DraggableScrollableActuator.reset(context);
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoWebViewScreen(
                          videoUrl: 'https://www.youtube.com/embed/oxZxe092eqo',
                        ),
                      ),
                    );
                  }
                },
                label: Text(
                  showDetails ? 'عرض الوصفة بالفيديو' : 'عرض التفاصيل',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.darkButton,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInfo(String label, String time, double width, bool isDarkMode) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.cookTime(width, isDark: isDarkMode),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: AppTextStyles.ingredientsText(width, isDark: isDarkMode).copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}