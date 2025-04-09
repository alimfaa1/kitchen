class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String prepTime;
  final String cookTime;
  final String totalTime;
  final List<String> ingredients;
  final String category;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.prepTime,
    required this.cookTime,
    required this.totalTime,
    required this.ingredients,
    required this.category,
  });
}

final List<Recipe> dummyRecipes = [
  // Salad
  Recipe(
    id: 'r1',
    title: 'Salmon Salad',
    description: 'Fresh salmon with green vegetables and dressing.',
    imageUrl: '', // No image
    prepTime: '10 min',
    cookTime: '5 min',
    totalTime: '15 min',
    ingredients: ['Salmon', 'Lettuce', 'Tomato', 'Olive Oil'],
    category: 'Salad',
  ),
  Recipe(
    id: 'r2',
    title: 'Avocado Salad',
    description: 'Creamy avocado salad with lemon zest.',
    imageUrl: '',
    prepTime: '8 min',
    cookTime: '0 min',
    totalTime: '8 min',
    ingredients: ['Avocado', 'Lemon', 'Cucumber', 'Salt'],
    category: 'Salad',
  ),

  // Bread
  Recipe(
    id: 'r3',
    title: 'Garlic Bread',
    description: 'Crispy garlic bread with herbs and butter.',
    imageUrl: '',
    prepTime: '5 min',
    cookTime: '10 min',
    totalTime: '15 min',
    ingredients: ['Bread', 'Garlic', 'Butter', 'Parsley'],
    category: 'Bread',
  ),
  Recipe(
    id: 'r4',
    title: 'Baguette',
    description: 'Classic French baguette with a crispy crust.',
    imageUrl: '',
    prepTime: '15 min',
    cookTime: '20 min',
    totalTime: '35 min',
    ingredients: ['Flour', 'Yeast', 'Salt', 'Water'],
    category: 'Bread',
  ),

  // Pancake
  Recipe(
    id: 'r5',
    title: 'Banana Pancake',
    description: 'Sweet pancakes made with ripe bananas.',
    imageUrl: '',
    prepTime: '10 min',
    cookTime: '10 min',
    totalTime: '20 min',
    ingredients: ['Banana', 'Flour', 'Egg', 'Milk'],
    category: 'Pancake',
  ),
  Recipe(
    id: 'r6',
    title: 'Blueberry Pancake',
    description: 'Pancakes topped with fresh blueberries.',
    imageUrl: '',
    prepTime: '10 min',
    cookTime: '10 min',
    totalTime: '20 min',
    ingredients: ['Blueberries', 'Flour', 'Egg', 'Milk'],
    category: 'Pancake',
  ),

  // Cake
  Recipe(
    id: 'r7',
    title: 'Chocolate Cake',
    description: 'Rich and moist chocolate cake with frosting.',
    imageUrl: '',
    prepTime: '15 min',
    cookTime: '30 min',
    totalTime: '45 min',
    ingredients: ['Cocoa', 'Flour', 'Eggs', 'Sugar'],
    category: 'Cake',
  ),
  Recipe(
    id: 'r8',
    title: 'Vanilla Cake',
    description: 'Light vanilla cake perfect for all occasions.',
    imageUrl: '',
    prepTime: '12 min',
    cookTime: '28 min',
    totalTime: '40 min',
    ingredients: ['Vanilla', 'Flour', 'Eggs', 'Milk'],
    category: 'Cake',
  ),
];
