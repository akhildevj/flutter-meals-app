import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];

    final categoryMeals = mealsData
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

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
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
