import 'package:flutter/material.dart';
import 'package:meals/data/categorydata.dart';
import 'package:meals/models/categorymodel.dart';
import 'package:meals/screen/appbar.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = dummyMealModels
        .where((meal) => meal.categories.contains(category.card.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                title: category.card.imageText, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarClass(),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.6,
          // crossAxisSpacing: 1,
          // mainAxisSpacing: 1
        ),
        children: [
          // const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
          for (final categoryModel in availableCategories)
            CardData(
                imageAddress: categoryModel.card.imageAddress,
                imageText: categoryModel.card.imageText,
                id: categoryModel.card.id,
                onSelectCategory: () {
                  _selectCategory(context, categoryModel);
                }),
        ],
      ),
    );
  }
}
