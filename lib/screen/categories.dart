import 'package:flutter/material.dart';
import 'package:meals/data/categorydata.dart';
import 'package:meals/models/categorymodel.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/card.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({super.key, required this.availableMeals});
  final List<MealModel> availableMeals;

  void _selectCategory(BuildContext context, CategoryModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.imageText,
          meals: availableMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Uncomment if you want an AppBar
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: AppBarClass(),
      // ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Adjust columns as needed
          childAspectRatio: 2.0,
        ),

        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
        
         final category = availableCategories[index];
          return CardData(
            // Assuming CardWidget extends StatelessWidget
            imageAddress: category.imageAddress,
            imageText: category.imageText,
            id: category.id,
            onSelectCategory: () => _selectCategory(context, category),
          );
        },
      ),
    );
  }
}
