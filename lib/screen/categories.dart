import 'package:flutter/material.dart';
import 'package:meals/data/categorydata.dart';
import 'package:meals/models/categorymodel.dart';
import 'package:meals/screen/appbar.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.imageText,
          meals: dummyMealModels.where((meal) => meal.categories.contains(category.id)).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarClass(),
      ),
      body: _buildCategoryGrid(context),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    // Create a list of widgets
    List<Widget> categoryCards = availableCategories.map((category) {
      return CardData(
        imageAddress: category.imageAddress,
        imageText: category.imageText,
        id: category.id,
        onSelectCategory: () => _selectCategory(context, category),
      );
    }).toList();

    // Return a GridView with the list of widgets
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.0,
      ),
      children: categoryCards,
    );
  }
}
