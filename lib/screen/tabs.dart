import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favprovider.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:meals/provider/meal_provider.dart';
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

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  
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


  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealP = ref.watch(mealProvider);
    final availableMeals = mealP.where((MealModel) {
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
      availableMeals: availableMeals,
    );
    var activePageTitle = "Select Your Favorite Cuisine";

    if (_selectedPageIndex == 1) {
      final favroiteMeal = ref.watch(favMealProvider);
      activePage = MealsScreen(
        meals: favroiteMeal,
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
