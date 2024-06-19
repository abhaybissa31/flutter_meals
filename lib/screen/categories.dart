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
          title: category.card.imageText,
          meals: dummyMealModels.where((meal) => meal.categories.contains(category.card.id)).toList(),
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
        imageAddress: category.card.imageAddress,
        imageText: category.card.imageText,
        id: category.card.id,
        onSelectCategory: () => _selectCategory(context, category),
      );
    }).toList();

    // Return a GridView with the list of widgets
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.6,
      ),
      children: categoryCards,
    );
  }
}
