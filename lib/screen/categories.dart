import 'package:flutter/material.dart';
import 'package:meals/data/categorydata.dart';
import 'package:meals/models/categorymodel.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<MealModel> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// with allows multiple inheritance
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // late keywords tells us that the value is not defined yet but will have later when needed
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 450),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, CategoryModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.imageText,
          meals: widget.availableMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      // Now only the padding widget would be rebuilt 60 times per second
      builder: (ctx, child) => SlideTransition(
          position: Tween(
            begin: const Offset(.2,.8), // offset has first value as x axis and second as y axis
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastEaseInToSlowEaseOut)),
          child: child),
      // here child means that child won't be rebuilt every 60 times per second
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Adjust columns as needed
          childAspectRatio: 2.0,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          final category = availableCategories[index];
          return CardData(
            // Assuming CardData extends StatelessWidget
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
