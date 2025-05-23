import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/app_info.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/developer.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/video_list.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // Close the drawer
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    } else if (identifier == 'info') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const InfoScreen()));
    } else if (identifier == 'videos') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const VideosScreen()));
    } else if (identifier == 'developer') {
      // NEW: Handle navigation to DeveloperMenuScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (ctx) =>
                  const DeveloperMenuScreen(), // Navigate to your DeveloperMenuScreen
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    String activePageTitle = 'Meals Category';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesMealProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Favorite Meals';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.amber),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
