import 'package:flutter/material.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  final List<MealModel> _favMeal = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavMeal(MealModel mealModel) {
    final isFavMealExsist = _favMeal.contains(mealModel);

    if (isFavMealExsist) {
      setState(() {
        _favMeal.remove(mealModel);
      });
      _showInfoMessage("Removed from your Favorites");
    } else {
      setState(() {
        _favMeal.add(mealModel);
      });
      _showInfoMessage("Added to your Favorites");
    }
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFav: _toggleFavMeal,
    );
    var activePageTitle = "Select Your Favorite Cuisine";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favMeal,
        onToggleFav: _toggleFavMeal,
      );
      activePageTitle = "Your Favorite Cuisines";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), //
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        enableFeedback: true,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.red,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_sharp),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
      ),
    );
  }
}
