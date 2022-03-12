import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './favorite/favorite.dart';
import './category/categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: const Text('Meals'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.pinkAccent,
            ),
          ),
          body: TabBarView(
              children: [CategoriesScreen(), const FavoriteScreen()]),
        ));
  }
}
