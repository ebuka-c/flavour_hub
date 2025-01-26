import 'package:flavor_hub/constants/images.dart';
import 'package:share_plus/share_plus.dart';

final categImages = [
  AppImages.breakfast,
  AppImages.dinner,
  AppImages.dessert,
  AppImages.noodles,
  AppImages.salad,
  AppImages.pasta
];

final imgRecommended = [
  AppImages.spag,
  AppImages.butterchicken,
  AppImages.seafoodfried,
  AppImages.jollofrice,
];

List<String> nameRecommended = [
  'Spaghetti Aligo',
  'Buttered Chicken',
  'Seafood Fried',
  'Jollof Rice',
];

List<String> categ = [
  'Breakfast',
  'Dinner',
  'Dessert',
  'Noodles',
  'Salads',
  'Pasta'
];

List<String> topRecipes = [
  'Big Mac',
  'Beef Sharwama',
  'Cheese Fries',
  'Italian Pizza',
];

List<String> topRImages = [
  AppImages.burger,
  AppImages.sharwama,
  AppImages.cheesefries,
  AppImages.pizza,
];

List<int> timeTaken = [
  20,
  30,
  40,
  50,
];

List instructions = [
  'Fill a large pot with water, add a pinch of salt, and bring it to a boil.',
  'Add spaghetti to the boiling water and cook according to the package instructions (usually 8-12 minutes).',
  'While the spaghetti cooks, heat olive oil in a pan. Add garlic, onions, and other desired ingredients (e.g., tomatoes, meat, or vegetables) to make the sauce.',
  'Once cooked, drain the spaghetti using a colander. Save some pasta water if needed for the sauce.',
];

List<Map> myFavorites = [];

List<Map> recipesTile = [
  {
    'nationality': 'Keto', //changing nationality values to dietary preferences
    'name': 'Chicken and Chorizo Paella',
    'image':
        'https://i.pinimg.com/736x/b3/52/34/b3523405b4c3c41e08f99706851d20ec.jpg',
    'duration': 40,
    'favourite': false,
    'ingredients': [
      'Chicken breasts',
      'Fillets',
      'TBSP olive oil',
      'Fat garlic clove'
    ]
  },
  {
    'nationality': 'Keto', //changing nationality values to dietary preferences
    'name': 'Cheesy Taco Pasta',
    'image':
        'https://i.pinimg.com/736x/20/c1/53/20c153196c02a95c052e620480e09b3c.jpg',
    'duration': 50,
    'favourite': false,
    'ingredients': [
      '1/2 pound large shells pasta',
      '1 pound ground beef',
      '2 tablespoons taco seasoning',
      'Pepper'
    ]
  },
  {
    'nationality':
        'Vegetarian', //changing nationality values to dietary preferences
    'name': 'Kontomire and Ampesi',
    'image':
        'https://i.pinimg.com/736x/60/bc/03/60bc0360b5a49822970091e25ff749ee.jpg',
    'duration': 40,
    'favourite': false,
    'ingredients': ['taro leaves (kontomire)', 'boiled plantain', 'yam', 'salt']
  },
  {
    'nationality': 'Vegetarian',
    'name': 'Lo Mein Noodles',
    'image':
        'https://www.recipetineats.com/tachyon/2019/11/Lo-Mein_5.jpg?resize=900%2C1260&zoom=0.72',
    'duration': 40,
    'favourite': false,
    'ingredients': [
      'egg noodles',
      'vegetables',
      'protein',
      'sauce',
      'sesame oil'
    ]
  },
  {
    'nationality': 'Keto',
    'name': 'Cheesy Beef Fiesta Wraps',
    'image':
        'https://i0.wp.com/northeastnosh.com/wp-content/uploads/2024/05/Cheesy-Beef-Fiesta-Wraps.jpg?w=960&ssl=1',
    'duration': 50,
    'favourite': false,
    'ingredients': [
      '1 lb. ground beef',
      '1 cup nacho cheese sauce',
      '4 large flour tortillas',
      '1/2 cup diced tomatoes',
      '1/4 cup sliced jalapeños'
    ]
  },
  {
    'nationality': 'Gluten-Free',
    'name': 'Moqueca (Brazilian Seafood Stew)',
    'image':
        'https://i.pinimg.com/736x/b4/89/cf/b489cf6b6caa47800d3056a2bec1c564.jpg',
    'duration': 70,
    'favourite': false,
    'ingredients': [
      'firm white fish',
      'onions',
      'garlic',
      'bell peppers',
      'tomatoes',
      'cilantro',
      'coconut milk'
    ]
  },
  {
    'nationality': 'Fast Food',
    'name': 'Pizza',
    'image': AppImages.pizza,
    'duration': 70,
    'favourite': false,
    'ingredients': [
      'Olive oil',
      'Tsp salt',
      '1 and 1/3 cups (320ml) warm water',
      'Dried basil',
      'Yeast'
    ]
  },
];

void shareRecipe(Map recipe) {
  final String recipeName = recipe['name'];
  final String recipeIngredients =
      (recipe['ingredients'] as List<String>).join(', ');
  final String recipeImage = recipe['image'];

  String content =
      "Check out this recipe: $recipeName\nIngredients: $recipeIngredients\nRecipe Image: $recipeImage";

  Share.share(content);
}

/*
// Save favorites
Future<void> saveFavorites(List<Map> favorites) async {
  // Convert the list of favorites to a JSON string
  String favoritesJson = jsonEncode(favorites);

  // Save the JSON string in GetStorage
  await getStorageInstance.write(FAVOURITES, favoritesJson);
}

Future<List<Map>> loadFavorites() async {
  // Retrieve the favorites JSON string from GetStorage
  String? favoritesJson = getStorageInstance.read(FAVOURITES);

  // If the favorites data exists, decode it
  if (favoritesJson != null) {
    List<dynamic> decodedData = jsonDecode(favoritesJson);
    return List<Map>.from(decodedData);
  } else {
    return [];
  }
}
*/
