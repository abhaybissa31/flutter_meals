import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/provider/favprovider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.mealModel,
  });
  final MealModel mealModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mealModel.title),
          actions: [
            IconButton(
                onPressed: () {
                  final wasAdded = ref
                      .read(favMealProvider.notifier)
                      .toggleMealFavStatus(mealModel);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(wasAdded
                          ? "Meals added to fav"
                          : "Meals removed from fav"),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.star))
          ],
          backgroundColor: const Color.fromARGB(255, 0, 0, 0), //
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                mealModel.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredients in mealModel.ingredients)
                Text(
                  ingredients,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(
                height: 14,
              ),
              Text("Steps",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(
                height: 14,
              ),
              for (final steps in mealModel.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
