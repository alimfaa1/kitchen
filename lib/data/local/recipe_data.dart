// 📁 lib/data/models/recipe_data.dart

class Recipe {
  final String title;
  final String description;
  final String imagePath;
  final String prepTime;
  final String cookTime;
  final String totalTime;
  final List<String> ingredients;
  final List<String> steps;
  final String author;

  const Recipe({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.prepTime,
    required this.cookTime,
    required this.totalTime,
    required this.ingredients,
    required this.steps,
    required this.author,
  });
}

final List<Recipe> recipes = [
  Recipe(
    title: 'برجر مع صوص البرجر وصوص الجبنة',
    description: 'وصفة برجر لذيذة وسريعة التحضير مع صوص خاص مميز.',
    imagePath: 'assets/images/burger.jpeg',
    prepTime: '10 دقائق',
    cookTime: '20 دقيقة',
    totalTime: '30 دقيقة',
    ingredients: [
      '1 قطعة لحم برجر',
      '2 ملعقة كبيرة صوص جبنة',
      'خبز برجر',
      'خس وطماطم وبصل',
      'رشة ملح وفلفل أسود',
    ],
    steps: [
      'سخن المقلاة على نار متوسطة.',
      'ضع البرجر في المقلاة واطهه 5 دقائق لكل جانب.',
      'قم بتسخين الخبز ثم أضف الخس والطماطم.',
      'ضع اللحم في الخبز مع صوص الجبنة.',
    ],

    author: 'Ali Ahmed',
  ),
  Recipe(
    title: 'برجر مع صوص البرجر وصوص الجبنة',
    description: 'وصفة برجر لذيذة وسريعة التحضير مع صوص خاص مميز.',
    imagePath: 'assets/images/burger.jpeg',
    prepTime: '10 دقائق',
    cookTime: '20 دقيقة',
    totalTime: '30 دقيقة',
    ingredients: [
      '1 قطعة لحم برجر',
      '2 ملعقة كبيرة صوص جبنة',
      'خبز برجر',
      'خس وطماطم وبصل',
      'رشة ملح وفلفل أسود',
    ],
    steps: [
      'سخن المقلاة على نار متوسطة.',
      'ضع البرجر في المقلاة واطهه 5 دقائق لكل جانب.',
      'قم بتسخين الخبز ثم أضف الخس والطماطم.',
      'ضع اللحم في الخبز مع صوص الجبنة.',
    ],
    author: 'Ali Ahmed',
  ),
  Recipe(
    title: 'برجر مع صوص البرجر وصوص الجبنة',
    description: 'وصفة برجر لذيذة وسريعة التحضير مع صوص خاص مميز.',
    imagePath: 'assets/images/burger.jpeg',
    prepTime: '10 دقائق',
    cookTime: '20 دقيقة',
    totalTime: '30 دقيقة',
    ingredients: [
      '1 قطعة لحم برجر',
      '2 ملعقة كبيرة صوص جبنة',
      'خبز برجر',
      'خس وطماطم وبصل',
      'رشة ملح وفلفل أسود',
      'خس وطماطم وبصل',
      'خس وطماطم وبصل',
      'خس وطماطم وبصل',
      'خس وطماطم وبصل',
    ],
    steps: [
      'سخن المقلاة على نار متوسطة.',
      'ضع البرجر في المقلاة واطهه 5 دقائق لكل جانب.',
      'قم بتسخين الخبز ثم أضف الخس والطماطم.',
      'ضع اللحم في الخبز مع صوص الجبنة.',
    ],
    author: 'Ali Ahmed',
  ),
];
