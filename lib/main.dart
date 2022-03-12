import 'package:flutter/material.dart';

import './screens/tabs.dart';
import './screens/category/category_meals.dart';
import './screens/meal/meal_detail.dart';
import './screens/category/categories.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (_) => const TabsScreen(),
        CategoryMealScreen.routeName: (_) => const CategoryMealScreen(),
        MealDetailScreen.routeName: (_) => const MealDetailScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
