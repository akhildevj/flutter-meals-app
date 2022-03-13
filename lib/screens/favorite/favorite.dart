import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> meals;

  const FavoriteScreen({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return const Center(
        child: Text('You have no Favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (_, index) => MealItem(
          id: meals[index].id,
          title: meals[index].title,
          imageUrl: meals[index].imageUrl,
          duration: meals[index].duration,
          complexity: meals[index].complexity,
          affordability: meals[index].affordability,
        ),
        itemCount: meals.length,
      );
    }
  }
}
