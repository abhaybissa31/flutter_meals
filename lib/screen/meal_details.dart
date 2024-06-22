import 'package:flutter/material.dart';
import 'package:meals/models/mealmodel.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.mealModel});
  final MealModel mealModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mealModel.title),
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
                      fontWeight: FontWeight.bold
                    ),
              ),
              
              const SizedBox(height:14,),
          
              for (final ingredients in mealModel.ingredients)
                Text(ingredients,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),),
          
              const SizedBox(height: 14,),
          
              Text("Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,)
              ),
          
              const SizedBox(height: 14,),
          
              for (final steps in mealModel.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal:8),
                  child: Text(steps,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        
                      ),),
                ),
            ],
          ),
        ));
  }
}
