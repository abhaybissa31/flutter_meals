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
    final favroiteMeal = ref.watch(favMealProvider);
    final isFav = favroiteMeal.contains(mealModel);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.purple),
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
                          ? "Dish added to Favorites"
                          : "Dish removed from Favorites",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: AnimatedSwitcher(
                transitionBuilder: (child,animation) {
                  return RotationTransition(turns: Tween<double>(begin: 0,end: 1).animate(animation),filterQuality: FilterQuality.high,child: child,);
                },
                duration: const Duration(milliseconds: 700),

                // We use key to differntiate between the same kind of widget but holding different data. Here we
                // add isFav as value key because it'll make the key as true and false which are different values
                child: Icon(isFav?CupertinoIcons.star_fill:CupertinoIcons.star,color: Colors.purple,key: ValueKey(isFav),),
                ),
                ),
          ],
          backgroundColor: const Color.fromARGB(255, 0, 0, 0), //
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: mealModel.id,
                child: Image.network(
                  mealModel.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
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
