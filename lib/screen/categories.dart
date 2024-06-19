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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.6,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (ctx, index) {
        final category = availableCategories[index];
        return CardData(
          imageAddress: category.card.imageAddress,
          imageText: category.card.imageText,
          id: category.card.id  ,
          onSelectCategory: () => _selectCategory(context, category),
        );
      },
    );
  }
}
