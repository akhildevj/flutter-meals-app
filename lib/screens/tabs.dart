import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import './favorite/favorite.dart';
import './category/categories.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> meals;

  const TabsScreen({Key? key, required this.meals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];

  @override
  initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FavoriteScreen(meals: widget.meals), 'title': "Favorites"},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              label: "Categories", icon: Icon(Icons.category)),
          BottomNavigationBarItem(label: "Favorites", icon: Icon(Icons.star))
        ],
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
