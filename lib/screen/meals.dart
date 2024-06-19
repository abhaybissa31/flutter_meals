import 'package:flutter/material.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    Widget content =
        ListView.builder(itemBuilder: (ctx, index) => Text(meals[index].title));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh.... Nothing here",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Try selecting a different category",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(mealModel: meals[index]));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:const Color.fromARGB(255, 0, 0, 0), //
      ),
      body: content,
    );
  }
}
