import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

import './screens/tabs.dart';
import './screens/filter/filters.dart';
import './screens/category/category_meals.dart';
import './screens/meal/meal_detail.dart';
import './screens/category/categories.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = mealsData;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = mealsData.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) return false;
        if (_filters['lactose'] as bool && !meal.isLactoseFree) return false;
        if (_filters['vegan'] as bool && !meal.isVegan) return false;
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final index = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals.add(mealsData.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akz-Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          secondaryHeaderColor: Colors.amber,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (_) => TabsScreen(meals: _favoriteMeals),
        CategoryMealScreen.routeName: (_) =>
            CategoryMealScreen(meals: _availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
            isMealFavorite: _isMealFavorite, toggleFavorites: _toggleFavorites),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(filters: _filters, setFilters: _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
