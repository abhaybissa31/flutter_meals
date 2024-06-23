import 'package:flutter/material.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  
  const MealsScreen({super.key, this.title,required this.onToggleFav ,required this.meals});
  final String? title;
  final List<MealModel> meals;
  final void Function(MealModel mealModel) onToggleFav;

  void getSelectedMeal(BuildContext context, MealModel mealModel) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(mealModel: mealModel,onToggleFav: onToggleFav,)));
  }

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
          itemBuilder: (ctx, index) => MealItem(
                mealModel: meals[index],
                onSelectMeal: (mealModel) =>
                    {getSelectedMeal(context, mealModel)},
              ));
          }

          if (title == null) {
            return content;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(title!),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0), //
            ),
            body: content,
          );
  }
}
