import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function setFilters;

  const FiltersScreen(
      {Key? key, required this.filters, required this.setFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget.filters['gluten'] as bool;
    _isLactoseFree = widget.filters['lactose'] as bool;
    _isVegan = widget.filters['vegan'] as bool;
    _isVegetarian = widget.filters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (value) => updateValue(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                };
                widget.setFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust Your Meal Selection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten Free',
                'Only Include Gluten Free Meals',
                _isGlutenFree,
                (value) => setState(() => _isGlutenFree = value)),
            _buildSwitchListTile(
                'Lactose Free',
                'Only Include Lactose Free Meals',
                _isLactoseFree,
                (value) => setState(() => _isLactoseFree = value)),
            _buildSwitchListTile('Vegan', 'Only Include Vegan Meals', _isVegan,
                (value) => setState(() => _isVegan = value)),
            _buildSwitchListTile(
                'Vegetarian',
                'Only Include Vegetarian Meals',
                _isVegetarian,
                (value) => setState(() => _isVegetarian = value)),
          ],
        ))
      ]),
    );
  }
}
