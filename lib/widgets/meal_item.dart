import 'package:flutter/material.dart';
import 'package:meals/models/mealmodel.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        enableFeedback: true,
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealModel.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                ),
                
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        (mealModel.title),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow:TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(icon: Icons.schedule_rounded, label: '${mealModel.duration} min'),
                          const SizedBox(width: 12,),
                          MealItemTrait(icon: Icons.work_history_sharp, label: mealModel.complexity.name[0].toUpperCase()+mealModel.complexity.name.substring(1)),
                          const SizedBox(width: 12,),
                          MealItemTrait(icon: Icons.attach_money_sharp, label: mealModel.affordability.name[0].toUpperCase()+mealModel.affordability.name.substring(1)),

                        ],
                      )
                    ],
                  ),
                ),
                )
          ],
        ),
      ),
    );
  }
}
