import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/category_item.dart';
import '../../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  final appBar = AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [Text("Meals App")],
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: categoriesData
          .map((category) => CategoryItem(
              id: category.id, title: category.title, color: category.color))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
