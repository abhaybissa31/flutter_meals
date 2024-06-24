import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/categorydata.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filter.dart';
import 'package:meals/screen/main_drawer.dart';
import 'package:meals/screen/meals.dart';

const kInitialFilter = {
    Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian:false
  };

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  
  Map<Filters, bool> _selectedFilters = kInitialFilter ;


  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  FilterScreen(currentFilters: _selectedFilters,),
        ),
      );
      setState(() {
      _selectedFilters = result ?? kInitialFilter;
      });
    }
  }

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

    final availableMeals = dummyMealModels.where((MealModel) {
      if(_selectedFilters[Filters.glutenFree]! && !MealModel.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filters.lactoseFree]! && !MealModel.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filters.vegan]! && !MealModel.isVegan){
        return false;
      }
      if(_selectedFilters[Filters.vegetarian]! && !MealModel.isVegetarian){
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFav: _toggleFavMeal,
      availableMeals: availableMeals,
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
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      drawerScrimColor: Colors.black.withOpacity(0.6),
      drawerEnableOpenDragGesture: true,
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        enableFeedback: true,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.red,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_sharp),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_circle_fill),
            label: "Favorites",
          )
        ],
      ),
    );
  }
}
