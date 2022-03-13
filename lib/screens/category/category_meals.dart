import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> meals;

  const CategoryMealScreen({Key? key, required this.meals}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal> displayedMeals = [];
  var _loadInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
      final categoryId = routeArguments['id'];

      displayedMeals = widget.meals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(categoryTitle as String),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          complexity: displayedMeals[index].complexity,
          affordability: displayedMeals[index].affordability,
        ),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
